from odoo import models, fields

class MaintenanceBlock(models.Model):
    _name = 'maintenance.block'
    _description = 'Maintenance Block'

    name = fields.Char(required=True)
