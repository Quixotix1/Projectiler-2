class_name Enemy # Should be considered abstract

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
