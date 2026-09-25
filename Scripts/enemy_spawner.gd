class_name EnemySpawner

extends Node3D

@export var enemy: PackedScene
@export var spawn_delay: float
@export var min_distance: float
@export var max_distance: float

var remaining_enemies = 0

func start_wave(num_enemies: int):
	$SpawnTimer.wait_time = spawn_delay
	remaining_enemies = num_enemies
	WaveInfoTracker.remaining_enemies = num_enemies
	$SpawnTimer.start()

func _on_spawn_timer_timeout() -> void:
	var x = randf_range(-1, 1)
	var y = randf_range(-1, 1)
	var spawn_position = Vector2(x, y).normalized()
	
	var scale = randf_range(min_distance, max_distance)
	spawn_position = spawn_position * scale
	
	var new_enemy = enemy.instantiate()
	new_enemy.position = Vector3(x, 0, y)
	owner.add_child(new_enemy)
	
	remaining_enemies -= 1
	if remaining_enemies <= 0:
		$SpawnTimer.stop()
