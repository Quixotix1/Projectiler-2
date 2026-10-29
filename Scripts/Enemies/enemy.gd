@abstract class_name Enemy

extends CharacterBody3D
	
@export var bullets: Array[Node3D]
@export var speed: float
@onready var player = get_tree().get_first_node_in_group("Player")

func _attack() -> void:
	pass

func _update_movement(delta: float) -> void:
	pass

func _process(delta: float) -> void:
	_attack()
	_update_movement(delta)

func _get_direction_to_player() -> Vector3:
	var z_distance_from_player = player.position.z - position.z
	var x_distance_from_player = player.position.x - position.x
	var distance_from_player = position.distance_to(player.position)
	
	return Vector3(
		x_distance_from_player / distance_from_player,
		0,
		z_distance_from_player / distance_from_player
		)
