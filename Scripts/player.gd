extends CharacterBody3D

@export var camera: Camera3D
@export var bullet: PackedScene
@export var speed = 10.0
@export var rotation_speed = 10.0

func _ready() -> void:
	pass

func _update_rotation():
	var input_rotation = 0
	
	if Input.is_action_pressed("rotate_left"):
		input_rotation = 1
	if Input.is_action_pressed("rotate_right"):
		input_rotation = -1
	
	input_rotation *= rotation_speed
	
	rotation.y += input_rotation

func _update_movement():
	var input_direction = Vector3.ZERO
	var rotated_direction = Vector3.ZERO
	
	if Input.is_action_pressed("up"):
		input_direction.z -= 1
	if Input.is_action_pressed("down"):
		input_direction.z += 1
	if Input.is_action_pressed("left"):
		input_direction.x -= 1
	if Input.is_action_pressed("right"):
		input_direction.x += 1
	
	if Input.is_action_just_pressed("fire"): # To-do: THIS SOLUTION IS DUMB AND BAD AND SHOULD BE DECOUPLED FROM THE PLAYER SCRIPT
		var bullet_instance = bullet.instantiate()
		bullet_instance.global_position = $Gun/Model.global_position
		bullet_instance.rotation.y = rotation.y + $Gun.rotation.y
		owner.add_child(bullet_instance)
	
	if input_direction != Vector3.ZERO:
		rotated_direction.x = cos(-rotation.y) * input_direction.x - sin(-rotation.y) * input_direction.z
		rotated_direction.z = sin(-rotation.y) * input_direction.x + cos(-rotation.y) * input_direction.z
		rotated_direction = rotated_direction.normalized()
	
	velocity = rotated_direction * speed
	
	move_and_slide()

func _update_aim():
	var mouse_position = get_viewport().get_mouse_position()
	mouse_position.x -= camera.unproject_position(position).x
	mouse_position.y -= camera.unproject_position(position).y
	mouse_position.y = -mouse_position.y
	
	if mouse_position != Vector2.ZERO:
		mouse_position = mouse_position.normalized()
	
	if mouse_position.x > 0:
		$Gun.rotation.y = asin(mouse_position.y) - PI / 2
	else:
		$Gun.rotation.y = PI / 2 - asin(mouse_position.y)

func _physics_process(delta: float) -> void:
	_update_rotation()
	_update_movement()
	_update_aim()
