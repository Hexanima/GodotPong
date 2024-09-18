extends Button
@export var DOWN: StringName

func _pressed():
	Input.action_press(DOWN)
