extends Node

var current_wave = 0
var remaining_enemies = 0:
	get:
		return remaining_enemies
	set(value):
		remaining_enemies = value
		if remaining_enemies == 0:
			EventBus.wave_complete.emit()

func _ready() -> void:
	EventBus.wave_start.connect(_on_wave_start)

func _on_wave_start():
	WaveInfoTracker.current_wave += 1
