from odoo import fields, models


class ResCompany(models.Model):
    _inherit = 'res.company'

    limite_descuento_global = fields.Float(
        string='Límite de Descuento Global (%)',
        default=15.0,
        help='Porcentaje máximo de descuento permitido en órdenes de venta sin aprobación de supervisor'
    )
