extends Node3D

@export var enemy_spawner: Spawner
@export var spawn_counter: Counter
@export var enemy_spawn_delay = 1.0 # TO-DO: I don't know where I want this in the final deliverable, but definitely not here
@export var min_spawn_distance: float
@export var max_spawn_distance: float

@export var enemies: Array[PackedScene] = [
	preload(Constants.SCENE_PATHS.basic_enemy)
]

func _ready() -> void:
	EventBus.wave_start.connect(_on_wave_start)

func _on_next_wave_button_pressed() -> void:
	EventBus.wave_start.emit()

func _on_wave_start():
	print("Start wave.")
	$SpawnTimer.wait_time = enemy_spawn_delay
	spawn_counter.set_count(WaveInfoTracker.current_wave)
	WaveInfoTracker.remaining_enemies = WaveInfoTracker.current_wave
	$SpawnTimer.start()

# TO-DO: Not a fan of the direct references to $SpawnTimer, should be refactored somehow
func _on_spawn_timer_timeout() -> void:
	print("Spawn enemy")
	var x = randf_range(-1, 1)
	var y = randf_range(-1, 1)
	var spawn_position = Vector3(x, 0, y).normalized()
	
	var spawn_scale = randf_range(min_spawn_distance, max_spawn_distance)
	spawn_position = spawn_position * spawn_scale
	
	enemy_spawner.spawn_scene(spawn_position, Vector3.ZERO, enemies[0])
	
	if spawn_counter.tick():
		$SpawnTimer.stop()
