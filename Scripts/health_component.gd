extends Area3D

@export var die_on_hit = false
@export var max_health: int

var dead = false
var health: int:
	get:
		return health
	set(value):
		health = value
		if health <= 0:
			_die()

func _ready() -> void:
	health = max_health

func take_damage(value):
	health -= value
	if health <= 0:
		_die()

func _die():
	if not dead and get_parent().is_in_group("Enemy"):
		WaveInfoTracker.remaining_enemies -= 1
		dead = true
	get_parent().queue_free() # this should use a subscribe model to avoid bugs

func _on_area_entered(area: Area3D) -> void:
	if die_on_hit:
		_die()
	elif "damage" in area.get_parent():
		take_damage(area.get_parent().damage)
