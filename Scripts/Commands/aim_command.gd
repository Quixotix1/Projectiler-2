class_name AimCommand

extends Command

var camera: Camera3D

var mouse_position = Vector3.ZERO

func _init(camera: Camera3D):
	self.camera = camera

func execute(actor: Object = null):
	mouse_position = actor.get_viewport().get_mouse_position()
	mouse_position.x -= camera.unproject_position(actor.position).x
	mouse_position.y -= camera.unproject_position(actor.position).y
	mouse_position.y = -mouse_position.y
	mouse_position = mouse_position.normalized()
	
	if mouse_position.x > 0:
		actor.gun_anchor.rotation.y = asin(mouse_position.y) - PI / 2
	else:
		actor.gun_anchor.rotation.y = PI / 2 - asin(mouse_position.y)
