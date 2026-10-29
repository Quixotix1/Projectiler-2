class_name Counter

extends Node

var count: int:
	get:
		return count
	set(value):
		count = value
		print("Count has been changed to ", value, ".")

func set_count(value):
	if count == 0:
		count = value
	else:
		push_warning("Count is not zero. Use override_count(value) function to directly modify the count.")

func override_count(value):
	count = value
	print("Count overridden as ", value)

func tick() -> bool:
	if count < 1:
		push_warning("Count is not greater than zero, but tick() is being accessed.")
		return false
	count -= 1
	return count == 0
