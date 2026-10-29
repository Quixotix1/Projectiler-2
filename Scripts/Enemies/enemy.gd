@abstract class_name Enemy

extends CharacterBody3D

var target_velocity: Vector3

@export var bullets: Array[Node3D]
@export var speed: float
@onready var player = get_tree().get_first_node_in_group("Player")

func _attack() -> void:
	pass

func _update_movement(delta: float) -> void:
	pass

func _process(delta: float) -> void:
	if not player:
		return
	
	_attack()
	_update_movement(delta)
