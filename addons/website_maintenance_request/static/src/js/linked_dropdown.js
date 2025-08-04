
odoo.define('website_maintenance_request.linked_dropdown', function (require) {
    document.addEventListener('DOMContentLoaded', function () {
        const blockSelect = document.querySelector('select[name="block"]');
        const floorSelect = document.querySelector('select[name="floor"]');
        const classroomSelect = document.querySelector('select[name="classroom"]');

        if (!blockSelect || !floorSelect || !classroomSelect) return;

        blockSelect.addEventListener('change', function () {
            const blockId = this.value;
            fetch(`/get/floors?block_id=${blockId}`).then(res => res.json()).then(data => {
                floorSelect.innerHTML = '';
                data.forEach(floor => {
                    let opt = document.createElement('option');
                    opt.value = floor.id;
                    opt.textContent = floor.name;
                    floorSelect.appendChild(opt);
                });
                floorSelect.dispatchEvent(new Event('change'));
            });
        });

        floorSelect.addEventListener('change', function () {
            const blockId = blockSelect.value;
            const floorId = this.value;
            fetch(`/get/classrooms?block_id=${blockId}&floor_id=${floorId}`).then(res => res.json()).then(data => {
                classroomSelect.innerHTML = '';
                data.forEach(room => {
                    let opt = document.createElement('option');
                    opt.value = room.name;
                    opt.textContent = room.name;
                    classroomSelect.appendChild(opt);
                });
            });
        });
    });
});
