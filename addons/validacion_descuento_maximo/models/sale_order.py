from odoo import api, fields, models
from odoo.exceptions import UserError


DISCOUNT_LIMIT_ERROR = (
    "¡Alerta de Control (MVP)! Este pedido supera el 15% de descuento permitido. "
    "El presupuesto ha sido retenido en estado 'Requiere Revisión' para la aprobación de Diego."
)


class SaleOrder(models.Model):
    _inherit = 'sale.order'

    # Campo personalizado para el 15% del MVP
    descuento_maximo_permitido = fields.Float(
        string='Descuento Máximo Permisible (%)',
        default=15.0
    )

    # Añadimos el nuevo estado "Requiere Revisión" al flujo de ventas nativo
    state = fields.Selection(
        selection_add=[('requires_review', 'Requiere Revisión')],
        ondelete={'requires_review': 'set default'}
    )

    def _has_discount_above_limit(self):
        self.ensure_one()
        limite = self.env.company.limite_descuento_global or 15.0
        return any(
            line.discount > limite
            for line in self.order_line
            if not line.display_type
        )

    def _flag_discount_over_limit(self):
        """Retiene en 'requires_review' los pedidos que superan el límite.

        IMPORTANTE: este método NO lanza excepción. Lanzar UserError aquí
        revertiría (rollback) la transacción, y el estado 'requires_review'
        escrito justo antes nunca se persistiría. Esa era la causa por la que
        el botón 'Aprobar Descuento' nunca aparecía: el pedido volvía a 'draft'.
        """
        for order in self:
            if order.state in ('draft', 'sent') and order._has_discount_above_limit():
                order.with_context(skip_discount_limit_validation=True).write({
                    'state': 'requires_review',
                })

    @api.model_create_multi
    def create(self, vals_list):
        orders = super().create(vals_list)
        if not self.env.context.get('skip_discount_limit_validation'):
            orders._flag_discount_over_limit()
        return orders

    def write(self, vals):
        result = super().write(vals)
        if not self.env.context.get('skip_discount_limit_validation'):
            self._flag_discount_over_limit()
        return result

    def action_confirm(self):
        is_supervisor = self.env.user.has_group(
            'validacion_descuento_maximo.group_supervisor_descuentos'
        )
        over_limit = self.filtered(lambda o: o._has_discount_above_limit())
        if over_limit and not is_supervisor:
            # Persistimos el estado SIN lanzar excepción (evitamos el rollback)
            # y notificamos al usuario en lugar de bloquear con un error.
            over_limit.with_context(skip_discount_limit_validation=True).write({
                'state': 'requires_review',
            })
            return {
                'type': 'ir.actions.client',
                'tag': 'display_notification',
                'params': {
                    'title': 'Descuento requiere revisión',
                    'message': DISCOUNT_LIMIT_ERROR,
                    'type': 'warning',
                    'sticky': False,
                },
            }
        return super(SaleOrder, self).action_confirm()

    def action_approve_discount(self):
        self.ensure_one()
        if not self.env.user.has_group('validacion_descuento_maximo.group_supervisor_descuentos'):
            raise UserError("No tienes permisos de supervisor para aprobar este descuento")

        # Escribimos temporalmente el estado a 'draft' para que el action_confirm nativo lo acepte
        self.with_context(skip_discount_limit_validation=True).write({'state': 'draft'})

        # Ejecutamos el action_confirm pasando el contexto para bypass
        return self.with_context(skip_discount_limit_validation=True).action_confirm()


class SaleOrderLine(models.Model):
    _inherit = 'sale.order.line'

    @api.model_create_multi
    def create(self, vals_list):
        lines = super().create(vals_list)
        if not self.env.context.get('skip_discount_limit_validation'):
            lines.order_id._flag_discount_over_limit()
        return lines

    def write(self, vals):
        result = super().write(vals)
        if not self.env.context.get('skip_discount_limit_validation'):
            self.order_id._flag_discount_over_limit()
        return result
