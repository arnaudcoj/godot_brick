
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

const SPEEDUP = 400
const MAXSPEED = 30000

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	
func _fixed_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies :
		if body.is_in_group("Bricks"):
			body.queue_free()
			
		if body.get_name() == "Paddle":
			var speed = get_linear_velocity().length()
			var direction = get_pos() - body.get_node("Anchor").get_global_pos()
			var oldX = get_linear_velocity().normalized().x
			direction.x -= oldX / 4
			direction = direction.normalized()
			var velocity = direction * min(speed + SPEEDUP*delta, MAXSPEED*delta)
			set_linear_velocity(velocity)
			
	if(get_pos().y > get_viewport_rect().end.y):
		queue_free()
		
	if(get_tree().get_nodes_in_group("Bricks").size() == 0):
		queue_free()