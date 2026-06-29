from odoo import fields, models


class ResConfigSettings(models.TransientModel):
    _inherit = 'res.config.settings'

    limite_descuento_global = fields.Float(
        related='company_id.limite_descuento_global',
        string='Límite de Descuento Global (%)',
        readonly=False,
        help='Porcentaje máximo de descuento permitido en órdenes de venta sin aprobación de supervisor'
    )
