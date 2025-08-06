odoo.define('maintenance_cascade.public_form', function (require) {
    'use strict';
    
    var publicWidget = require('web.public.widget');
    
    publicWidget.registry.MaintenancePublicForm = publicWidget.Widget.extend({
        selector: '.maintenance-form',
        events: {
            'change #building_id': '_onBuildingChange',
            'change #floor_id': '_onFloorChange',
        },
        
        _onBuildingChange: function (ev) {
            var self = this;
            var buildingId = ev.currentTarget.value;
            
            // Reset dependent fields
            this.$('#floor_id').empty().append('<option value="">Loading...</option>').prop('disabled', true);
            this.$('#room_id').empty().append('<option value="">Select Floor First</option>').prop('disabled', true);
            
            if (buildingId) {
                this._rpc({
                    route: '/maintenance/get-floors/' + buildingId,
                    params: {},
                }).then(function (floors) {
                    var $floorSelect = self.$('#floor_id');
                    $floorSelect.empty().append('<option value="">Select Floor</option>');
                    
                    floors.forEach(function (floor) {
                        $floorSelect.append('<option value="' + floor[0] + '">' + floor[1] + '</option>');
                    });
                    
                    $floorSelect.prop('disabled', false);
                });
            }
        },
        
        _onFloorChange: function (ev) {
            var self = this;
            var floorId = ev.currentTarget.value;
            
            // Reset room field
            this.$('#room_id').empty().append('<option value="">Loading...</option>').prop('disabled', true);
            
            if (floorId) {
                this._rpc({
                    route: '/maintenance/get-rooms/' + floorId,
                    params: {},
                }).then(function (rooms) {
                    var $roomSelect = self.$('#room_id');
                    $roomSelect.empty().append('<option value="">Select Room</option>');
                    
                    rooms.forEach(function (room) {
                        $roomSelect.append('<option value="' + room[0] + '">' + room[1] + '</option>');
                    });
                    
                    $roomSelect.prop('disabled', false);
                });
            }
        },
    });
    
    return publicWidget.registry.MaintenancePublicForm;
});