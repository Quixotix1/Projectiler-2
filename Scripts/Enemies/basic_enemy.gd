class_name BasicEnemy

extends Enemy

func _update_movement(delta: float) -> void:
	look_at(player.position)
	
	var opposite = player.position.z - position.z
	var adjacent = player.position.x - position.x
	var hypoteneuse = position.distance_to(player.position)
	
	velocity.x = speed * adjacent / hypoteneuse
	velocity.z = speed * opposite / hypoteneuse
	
	move_and_slide()
