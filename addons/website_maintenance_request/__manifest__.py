{
    "name": "Website Maintenance Request",
    "version": "1.0",
    "summary": "Public form to submit maintenance requests with location and image",
    "depends": ["website", "maintenance"],
    "data": [
        "views/form_template.xml",
        "views/thank_you.xml",
        "views/block_view.xml",
        "views/floor_view.xml",
        "views/classroom_view.xml",
        "views/form_menu.xml"
    ],
    "assets": {
        "web.assets_frontend": [
            "/website_maintenance_request/static/src/js/linked_dropdown.js"
        ]
    },
    "installable": True,
    "application": True
}
