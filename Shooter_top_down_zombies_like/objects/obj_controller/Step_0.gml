if (global.points > 0 && global.points mod 10 == 0 && chest_created == 0) {
    var place = irandom_range(0, 3); // corrigido!
    var zx, zy;

    switch (place) {
        case 0: zx = irandom(room_width); zy = 50; break;        
        case 1: zx = irandom(room_width); zy = room_height - 50; break; 
        case 2: zx = 50; zy = irandom(room_height); break;        
        case 3: zx = room_width - 50; zy = irandom(room_height); break; 
    }

    instance_create_layer(zx, zy, "Chests", obj_chest);
    chest_created = 1;
}

// Zera o sinal para permitir novo baú quando sair do múltiplo de 10
if (global.points mod 10 != 0) {
    chest_created = 0;
}
