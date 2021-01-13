///add_hurtbox(sprite, startupF, activeF, recoverF, onHitF, owner);
var sprite = argument0;
var startup = argument1;
var activeF = argument2;
var recoverF = argument3;
var onHitF = argument4;
var owner = argument5;

var hurtbox = instance_create(other.x,other.y, obj_hurtbox);
hurtbox.sprite_index = sprite;
hurtbox.owner = owner;
