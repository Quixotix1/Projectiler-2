extends Node3D

@export var wave = 0
@export var next_wave_button: Button
@export var enemy_spawner: EnemySpawner

func _physics_process(delta: float) -> void:
	next_wave_button.visible = WaveInfoTracker.remaining_enemies == 0

func _on_next_wave_button_pressed() -> void:
	wave += 1
	enemy_spawner.start_wave(wave)
