import base64
from odoo import http
from odoo.http import request

class MaintenancePublicController(http.Controller):
    
    @http.route('/maintenance/request', type='http', auth='public', website=True, sitemap=True)
    def maintenance_form(self, **kwargs):
        """Display the public maintenance request form"""
        buildings = request.env['maintenance.building'].sudo().search([('active', '=', True)])
        return request.render('maintenance_cascade.public_maintenance_form', {
            'buildings': buildings,
        })
    
    @http.route('/maintenance/get-floors/<int:building_id>', type='json', auth='public')
    def get_floors(self, building_id):
        """Get floors for selected building"""
        floors = request.env['maintenance.floor'].sudo().search([
            ('building_id', '=', building_id),
            ('active', '=', True)
        ])
        return [[floor.id, floor.name] for floor in floors]
    
    @http.route('/maintenance/get-rooms/<int:floor_id>', type='json', auth='public')
    def get_rooms(self, floor_id):
        """Get rooms for selected floor"""
        rooms = request.env['maintenance.room'].sudo().search([
            ('floor_id', '=', floor_id),
            ('active', '=', True)
        ])
        return [[room.id, room.name] for room in rooms]
    
    @http.route('/maintenance/submit', type='http', auth='public', methods=['POST'], website=True, csrf=False)
    def submit_request(self, **post):
        """Handle form submission"""
        # Create maintenance request
        maintenance_request = request.env['maintenance.request'].sudo().create({
            'name': post.get('subject', 'Public Maintenance Request'),
            'description': post.get('description'),
            'building_id': int(post.get('building_id')) if post.get('building_id') else False,
            'floor_id': int(post.get('floor_id')) if post.get('floor_id') else False,
            'room_id': int(post.get('room_id')) if post.get('room_id') else False,
            'maintenance_type': 'corrective',
            'priority': post.get('priority', '0'),
            'requester_name': post.get('requester_name'),
            'requester_email': post.get('requester_email'),
            'requester_phone': post.get('requester_phone'),
        })
        
        # Handle file uploads
        if 'photos' in request.httprequest.files:
            files = request.httprequest.files.getlist('photos')
            for file in files:
                if file.filename:
                    attachment = request.env['ir.attachment'].sudo().create({
                        'name': file.filename,
                        'type': 'binary',
                        'datas': base64.b64encode(file.read()),
                        'res_model': 'maintenance.request',
                        'res_id': maintenance_request.id,
                    })
        
        return request.render('maintenance_cascade.thank_you_page', {
            'request_id': maintenance_request.id,
        })