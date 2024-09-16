extends Area2D

@export var player: Player
signal on_reset
func _physics_process(delta):
	if has_overlapping_bodies():
		on_reset.emit()
