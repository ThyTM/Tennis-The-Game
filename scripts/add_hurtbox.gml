///add_hurtbox(sprite, startupF, activeF, onHitF, owner);
var sprite = argument0;
var startupF = argument1;
var activeF = argument2;
var onHitF = argument3;
var owner = argument4;

var hurtbox = instance_create(other.x,other.y, obj_hurtbox);
hurtbox.sprite_index = sprite;
hurtbox.owner = owner;
hurtbox.startupF = startupF;
hurtbox.activeF = activeF;
hurtbox.onHitF = onHitF;
