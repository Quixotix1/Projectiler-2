extends Control

@export var next_wave_button: Button

func _ready() -> void:
	EventBus.wave_start.connect(_on_wave_start)
	EventBus.wave_complete.connect(_on_wave_complete)

func _on_wave_start():
	next_wave_button.visible = false

func _on_wave_complete():
	next_wave_button.visible = true
