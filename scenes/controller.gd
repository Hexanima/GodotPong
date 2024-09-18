extends Control

@export var UP : StringName
@export var DOWN : StringName

func _on_up_button_down():
	Input.action_press(UP)

func _on_down_button_down():
	Input.action_press(DOWN)

func _on_up_button_up():
	Input.action_release(UP)

func _on_down_button_up():
	Input.action_release(DOWN)
