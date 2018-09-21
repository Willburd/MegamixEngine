///scr_makerubble_Schmid_DL92(x,y,layer)
var xx = argument0;
var yy = argument1;
var layer = argument2;

var get_tile = tile_layer_find(layer,xx,yy);

if tile_exists(get_tile) {
    //found tile, time to break it!
    var tile_bg = tile_get_background(get_tile);
    var tile_tlx = tile_get_left(get_tile);
    var tile_tly = tile_get_top(get_tile);
    
    with instance_create(xx,yy,objSchmidNoivs_rubble) {
        bg_id = tile_bg;
        bg_x = tile_tlx;
        bg_y = tile_tly;
        vspeed -= random(2);
    }
    with instance_create(xx+8,yy,objSchmidNoivs_rubble) {
        bg_id = tile_bg;
        bg_x = tile_tlx+8;
        bg_y = tile_tly;
        vspeed -= random(2);
    }
    with instance_create(xx,yy+8,objSchmidNoivs_rubble) {
        bg_id = tile_bg;
        bg_x = tile_tlx;
        bg_y = tile_tly+8;
        vspeed -= random(2);
    }
    with instance_create(xx+8,yy+8,objSchmidNoivs_rubble) {
        bg_id = tile_bg;
        bg_x = tile_tlx+8;
        bg_y = tile_tly+8;
        vspeed -= random(2);
    }
    
    tile_delete(get_tile);
}

