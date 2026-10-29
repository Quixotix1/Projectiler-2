class_name BasicEnemy

extends Enemy

@export var damage: float

func _update_movement(delta: float) -> void:
	if not player:
		return
	
	look_at(player.position)
	
	var direction_to_player = _get_direction_to_player()
	
	velocity.x = speed * direction_to_player.x
	velocity.z = speed * direction_to_player.z
	
	move_and_slide()
