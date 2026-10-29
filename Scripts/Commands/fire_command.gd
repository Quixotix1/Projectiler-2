class_name FireCommand

extends Command

func _init():
	pass

func execute(actor: Object = null):
	actor.spawner.spawn_scene(
		actor.gun_object.global_position, 
		Vector3(0, actor.rotation.y + actor.gun_anchor.rotation.y, 0), 
		actor.bullet
	)
