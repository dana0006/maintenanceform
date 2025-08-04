from odoo import models, fields

class MaintenanceClassroom(models.Model):
    _name = 'maintenance.classroom'
    _description = 'Maintenance Classroom'

    name = fields.Char(required=True)
    block_id = fields.Many2one('maintenance.block', required=True)
    floor_id = fields.Many2one('maintenance.floor', required=True)
