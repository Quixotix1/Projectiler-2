class_name RotateCommand

extends Command

var velocity: float

func _init(input_velocity: float):
	velocity = input_velocity

func execute(actor: Object = null):
	actor.rotation.y += velocity
