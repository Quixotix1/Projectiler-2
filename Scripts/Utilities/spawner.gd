class_name Spawner

extends Node3D

@export var packed_scene: PackedScene
@export var parent: Node

func spawn_scene(position: Vector3, rotation: Vector3, _packed_scene := packed_scene, _parent := parent):
	var new_scene = _packed_scene.instantiate()
	new_scene.position = position
	new_scene.rotation = rotation
	
	var container = _parent
	if not container:
		container = self
	container.add_child(new_scene)
