extends Marker3D

@export var player: Node3D
@export var camera_offset_mode_delta: float
@export var camera_offset_mode_time: float

var camera_offset_is_enabled = false
var camera_is_offsetting = false

var time_since_toggle = 0.0

func _toggle_camera(delta: float):
	time_since_toggle += delta
	
	if camera_offset_is_enabled:
		$Camera3D.position.y = pow(1 - time_since_toggle / camera_offset_mode_time, 2) * camera_offset_mode_delta
	else:
		$Camera3D.position.y = camera_offset_mode_delta - pow(1 - time_since_toggle / camera_offset_mode_time, 2) * camera_offset_mode_delta
	
	if time_since_toggle >= camera_offset_mode_time:
		if camera_offset_is_enabled:
			$Camera3D.position.y = 0
		else:
			$Camera3D.position.y = camera_offset_mode_delta
		
		camera_is_offsetting = false
		camera_offset_is_enabled = !camera_offset_is_enabled

func _process(delta: float) -> void:
	global_position = player.global_position
	global_rotation.y = player.global_rotation.y
	
	if Input.is_action_just_pressed("toggle_camera") and not camera_is_offsetting:
		time_since_toggle = 0.0
		camera_is_offsetting = true
	
	if camera_is_offsetting:
		_toggle_camera(delta)
