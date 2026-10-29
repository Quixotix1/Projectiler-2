class_name BasicEnemy

extends Enemy

@export var damage: float
@export var rotation_speed: float = 0.01

var move_forward: Command
var rotate_left: Command
var rotate_right: Command

func _ready() -> void:
	move_forward = MoveCommand.new(Vector3.FORWARD)
	rotate_left = RotateCommand.new(rotation_speed)
	rotate_right = RotateCommand.new(-rotation_speed)

func _update_movement(delta: float) -> void:
	var forward = Vector3.FORWARD.rotated(Vector3.UP, rotation.y)
	var angle_to_player = VectorMath.get_xz_angle_between(position, player.position, forward)
	
	if angle_to_player < 0:
		rotate_left.execute(self)
	elif angle_to_player > 0:
		rotate_right.execute(self)
	
	move_forward.execute(self)
	
	velocity = target_velocity
	move_and_slide()
	target_velocity = Vector3.ZERO
