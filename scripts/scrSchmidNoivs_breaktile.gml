///scrSchmidNoivs_breaktile(x,y,width,height,layer);
//returns if a tile was broken or not!

var xx = argument0;
var yy = argument1;
var wid = argument2;
var hig = argument3;
var layer = argument4;

var broke_tile = false;


var get_tile = tile_layer_find(layer,xx,yy);

if tile_exists(get_tile) {
    //found tile, time to break it!
    var tile_bg = tile_get_background(get_tile);
    var tile_x = tile_get_x(get_tile);
    var tile_y = tile_get_y(get_tile);
    var tile_tlx = tile_get_left(get_tile);
    var tile_tly = tile_get_top(get_tile);
    var tile_wid = tile_get_width(get_tile);
    var tile_hig = tile_get_height(get_tile);
    
    //hori loop
    if tile_wid > wid {
        var breakloops = floor(tile_wid / wid);
        
        for (var i=1; i<breakloops; i+=1)
        {
            var offset = i * wid;
            tile_add(tile_bg,tile_tlx+offset,tile_tly,wid,tile_hig,tile_x+offset,tile_y,layer);
            broke_tile = true;
        }
    }
    
    //update tile
    tile_set_region( get_tile,tile_tlx,tile_tly,wid,tile_hig);
    
    //vert loop
    if tile_hig > hig {
        var breakloops = floor(tile_hig / hig);
        
        for (var i=1; i<breakloops; i+=1)
        {
            var offset = i * hig;
            tile_add(tile_bg,tile_tlx,tile_tly+offset,wid,hig,tile_x,tile_y+offset,layer);
            broke_tile = true;
        }
    }
    
    //update tile
    tile_set_region( get_tile,tile_tlx,tile_tly,wid,hig);
}

return broke_tile;
