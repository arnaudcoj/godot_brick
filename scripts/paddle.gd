
extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"

const PAD_SPEED = 400
var padle_size
var screen_size
	
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	padle_size = get_node("Sprite").get_texture().get_size()
	screen_size = get_viewport_rect().size
	
func _fixed_process(delta):
	var movement = Vector2(0,0)
	var pos = get_pos()
	if(pos.x - padle_size.width > 0 && Input.is_action_pressed("ui_left")):
		movement.x += - PAD_SPEED * delta
	if(pos.x + padle_size.width  < screen_size.width && Input.is_action_pressed("ui_right")):
		movement.x += PAD_SPEED * delta
	get_viewport().get_mouse_pos()
	translate(movement)
