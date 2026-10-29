class_name Player

extends CharacterBody3D

@export_category("Objects")
@export var bullet: PackedScene
@export var spawner: Spawner
@export var gun_object: Node
@export var gun_anchor: Node

# TO-DO: decouple into player information singleton when required
@export_category("Values")
@export var speed = 10.0
@export var acceleration = 2.0
@export var rotation_speed = 10.0

var target_velocity = Vector3.ZERO # Player will accelerate to this velocity at "acceleration"

var move_forward: Command
var move_backward: Command
var move_left: Command
var move_right: Command
var rotate_left: Command
var rotate_right: Command
var fire_command: Command
var aim_command: Command

func _ready() -> void:
	move_forward = MoveCommand.new(Vector3.FORWARD)
	move_backward = MoveCommand.new(Vector3.BACK)
	move_left = MoveCommand.new(Vector3.LEFT)
	move_right = MoveCommand.new(Vector3.RIGHT)
	rotate_left = RotateCommand.new(rotation_speed)
	rotate_right = RotateCommand.new(-rotation_speed)
	fire_command = FireCommand.new()
	aim_command = AimCommand.new(get_viewport().get_camera_3d())

func _process_commands():
	if Input.is_action_pressed("rotate_left"):
		rotate_left.execute(self)
	if Input.is_action_pressed("rotate_right"):
		rotate_right.execute(self)
	if Input.is_action_pressed("left"):
		move_left.execute(self)
	if Input.is_action_pressed("right"):
		move_right.execute(self)
	if Input.is_action_pressed("up"):
		move_forward.execute(self)
	if Input.is_action_pressed("down"):
		move_backward.execute(self)
	if Input.is_action_just_pressed("fire"):
		fire_command.execute(self)
	
	aim_command.execute(self)

func _physics_process(delta: float) -> void:
	_process_commands()
	
	velocity = velocity.move_toward(target_velocity, acceleration)
	move_and_slide()
	target_velocity = Vector3.ZERO # Reset for next frame
