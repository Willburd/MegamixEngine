///scrSchmidNoivs_makerubble(x,y,layer,breakstyle,breakintensity);
var xx = argument0;
var yy = argument1;
var layer = argument2;
var breakstyle = argument3;
var breakintensity = argument4;

//lets keep this clean
enum enmrSchmidNRubbleTypes {
    slighthop,
    diagonalcross,
    rando,
    Horsplit,
    Versplit,
    wackyblock,
}

//breaking speeds and directions
if(breakstyle = enmrSchmidNRubbleTypes.wackyblock) {
    //chooses a random style instead of a specific one
    breakstyle = irandom_range(enmrSchmidNRubbleTypes.slighthop,enmrSchmidNRubbleTypes.wackyblock);
}

//breaking animation control
switch breakstyle {
    default:
    case enmrSchmidNRubbleTypes.slighthop:
        //slight bounce up
        var tlxs = 0;
        var tlys = -random(breakintensity);
        var trxs = 0;
        var trys = -random(breakintensity);
        var blxs = 0;
        var blys = -random(breakintensity);
        var brxs = 0;
        var brys = -random(breakintensity);
    break;
    
    case enmrSchmidNRubbleTypes.diagonalcross:
        //diagonal breakapart
        var tlxs = -random(breakintensity);
        var tlys = -random(breakintensity);
        var trxs = +random(breakintensity)
        var trys = -random(breakintensity);
        var blxs = -random(breakintensity);
        var blys = +random(breakintensity);
        var brxs = +random(breakintensity);
        var brys = +random(breakintensity);
    break;
    
    case enmrSchmidNRubbleTypes.rando:
        //fullyrandom
        var tlxs = random_range(-breakintensity,breakintensity);
        var tlys = random_range(-breakintensity,breakintensity);
        var trxs = random_range(-breakintensity,breakintensity)
        var trys = random_range(-breakintensity,breakintensity);
        var blxs = random_range(-breakintensity,breakintensity);
        var blys = random_range(-breakintensity,breakintensity);
        var brxs = random_range(-breakintensity,breakintensity);
        var brys = random_range(-breakintensity,breakintensity);
    break;
    
    case enmrSchmidNRubbleTypes.Horsplit:
        //Horizontalsplit
        var tlxs = -breakintensity;
        var tlys = 0;
        var trxs = breakintensity;
        var trys = 0;
        var blxs = -breakintensity;
        var blys = 0;
        var brxs = breakintensity;
        var brys = 0;
    break;
    
    case enmrSchmidNRubbleTypes.Versplit:
        //Verticlesplit
        var tlxs = 0;
        var tlys = -breakintensity;
        var trxs = 0;
        var trys = -breakintensity;
        var blxs = 0;
        var blys = breakintensity;
        var brxs = 0;
        var brys = breakintensity;
    break;
}

    
//I'MA WRECK IT
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
        hspeed = tlxs;
        vspeed = tlys;
    }
    with instance_create(xx+8,yy,objSchmidNoivs_rubble) {
        bg_id = tile_bg;
        bg_x = tile_tlx+8;
        bg_y = tile_tly;
        hspeed = trxs;
        vspeed = trys;
    }
    with instance_create(xx,yy+8,objSchmidNoivs_rubble) {
        bg_id = tile_bg;
        bg_x = tile_tlx;
        bg_y = tile_tly+8;
        hspeed = blxs;
        vspeed = blys;
    }
    with instance_create(xx+8,yy+8,objSchmidNoivs_rubble) {
        bg_id = tile_bg;
        bg_x = tile_tlx+8;
        bg_y = tile_tly+8;
        hspeed = brxs;
        vspeed = brys;
    }
    
    tile_delete(get_tile);
}

