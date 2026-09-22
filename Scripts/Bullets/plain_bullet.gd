extends Bullet

func _ready() -> void:
	$destruction_timer.wait_time = lifespan
	var velocity_vector_2 = Vector2(travel_speed, 0).rotated(rotation.y)
	velocity.x = velocity_vector_2.x
	velocity.z = velocity_vector_2.y

func _process(delta: float) -> void:
	position.x -= velocity.z * delta
	position.z -= velocity.x * delta

func _on_destruction_timer_timeout() -> void:
	queue_free()
