{
    'name': 'Maintenance Location Cascade',
    'version': '18.0.1.0.0',
    'category': 'Maintenance',
    'summary': 'Public maintenance form with building/floor/room cascade',
    'depends': ['maintenance', 'website'],
    'data': [
        'security/ir.model.access.csv',
        'views/maintenance_location_views.xml',
        'views/maintenance_request_views.xml',
        'views/website_templates.xml',
        'data/website_menu.xml',
    ],
    'assets': {
        'web.assets_frontend': [
            'maintenance_cascade/static/src/js/public_form.js',
            'maintenance_cascade/static/src/css/public_form.css',
        ],
    },
    'installable': True,
    'application': False,
    'license': 'LGPL-3',
}