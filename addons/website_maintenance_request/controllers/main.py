from odoo import http, fields
from odoo.http import request
import base64

class MaintenanceRequestController(http.Controller):

    @http.route(['/maintenance-request'], type='http', auth='public', website=True)
    def maintenance_form(self, **kw):
        blocks = request.env['maintenance.block'].sudo().search([])
        return request.render('website_maintenance_request.form_template', {
            'blocks': blocks
        })

    @http.route(['/submit/maintenance'], type='http', auth='public', website=True, csrf=False)
    def submit_maintenance(self, **post):
        block = post.get('block')
        floor = post.get('floor')
        classroom = post.get('classroom')
        description = post.get('description')

        image_data = False
        image = post.get('image')
        if image:
            image_data = base64.b64encode(image.read())

        request.env['maintenance.request'].sudo().create({
            'name': f"Reported issue at {block}/{floor}/{classroom}",
            'description': description,
            'image': image_data,
        })
        return request.render('website_maintenance_request.thank_you_template')
