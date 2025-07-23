if (instance_exists(equiped_gun)) {
    with (equiped_gun) {
        instance_destroy();
    }
}

equiped_gun = instance_create_layer(x, y, "Gun", obj_shotgun);
