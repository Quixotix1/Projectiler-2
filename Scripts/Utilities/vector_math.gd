class_name VectorMath

static func get_xz_vector_between(from: Vector3, to: Vector3) -> Vector3:
	var z_distance_from = to.z - from.z
	var x_distance_from = to.x - from.x
	var distance_from = from.distance_to(to)
	
	return Vector3(
		x_distance_from / distance_from,
		0,
		z_distance_from / distance_from
	)

static func get_xz_angle_between(from: Vector3, to: Vector3, forward: Vector3 = Vector3.FORWARD) -> float:
	var to_xz = Vector2(to.x, to.z)
	var from_xz = Vector2(from.x, from.z)
	var forward_xz = Vector2(forward.x, forward.z)
	
	var relative_xz = to_xz - from_xz
	var angle_to = forward_xz.angle_to(relative_xz)
	
	return angle_to
