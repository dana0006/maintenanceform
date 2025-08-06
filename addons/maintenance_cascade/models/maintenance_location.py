from odoo import models, fields, api

class MaintenanceBuilding(models.Model):
    _name = 'maintenance.building'
    _description = 'Building'
    _order = 'sequence, name'
    
    name = fields.Char('Building Name', required=True)
    code = fields.Char('Building Code')
    sequence = fields.Integer('Sequence', default=10)
    floor_ids = fields.One2many('maintenance.floor', 'building_id', string='Floors')
    active = fields.Boolean('Active', default=True)

class MaintenanceFloor(models.Model):
    _name = 'maintenance.floor'
    _description = 'Floor'
    _order = 'sequence, name'
    
    name = fields.Char('Floor Name', required=True)
    sequence = fields.Integer('Sequence', default=10)
    building_id = fields.Many2one('maintenance.building', string='Building', required=True, ondelete='cascade')
    room_ids = fields.One2many('maintenance.room', 'floor_id', string='Rooms')
    active = fields.Boolean('Active', default=True)

class MaintenanceRoom(models.Model):
    _name = 'maintenance.room'
    _description = 'Room/Location'
    _order = 'sequence, name'
    
    name = fields.Char('Room Name', required=True)
    code = fields.Char('Room Number')
    sequence = fields.Integer('Sequence', default=10)
    floor_id = fields.Many2one('maintenance.floor', string='Floor', required=True, ondelete='cascade')
    building_id = fields.Many2one('maintenance.building', string='Building', related='floor_id.building_id', store=True, readonly=True)
    active = fields.Boolean('Active', default=True)

class MaintenanceRequest(models.Model):
    _inherit = 'maintenance.request'
    
    building_id = fields.Many2one('maintenance.building', string='Building')
    floor_id = fields.Many2one('maintenance.floor', string='Floor')
    room_id = fields.Many2one('maintenance.room', string='Room/Location')
    
    requester_name = fields.Char('Requester Name')
    requester_email = fields.Char('Requester Email')
    requester_phone = fields.Char('Requester Phone')
    
    @api.onchange('building_id')
    def _onchange_building_id(self):
        self.floor_id = False
        self.room_id = False
        return {'domain': {'floor_id': [('building_id', '=', self.building_id.id)]}}
        
    @api.onchange('floor_id')
    def _onchange_floor_id(self):
        self.room_id = False
        return {'domain': {'room_id': [('floor_id', '=', self.floor_id.id)]}}