class_name MoveCommand

extends Command

var direction = Vector3.ZERO

func _init(direction: Vector3 = Vector3.ZERO):
	self.direction = direction

func execute(actor: Object = null):
	# Error protection
	if actor is not CharacterBody3D:
		push_error("Actor is not CharacterBody3D in MoveCommand.")
		return
	
	var speed = 0.0
	
	if actor.speed:
		speed = actor.speed
	
	var rotated_direction = direction.rotated(Vector3.UP, actor.rotation.y)
	actor.target_velocity += speed * rotated_direction
