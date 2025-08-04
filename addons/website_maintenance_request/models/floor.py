from odoo import models, fields

class MaintenanceFloor(models.Model):
    _name = 'maintenance.floor'
    _description = 'Maintenance Floor'

    name = fields.Char(required=True)
    block_id = fields.Many2one('maintenance.block', required=True)
