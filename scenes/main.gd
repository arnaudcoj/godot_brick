
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

const ball_scene = preload("res://scenes/Ball.scn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process_input(true)
	
func _input(event):
	if event.is_action_pressed("instance_ball"):
		var ball = ball_scene.instance()
		ball.set_pos(get_node("Paddle").get_pos() - Vector2(0, 16))
		add_child(ball)


