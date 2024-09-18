extends Area2D
signal on_reset

@export var player: Player

@onready var goal_1 = $Goal1
@onready var goal_2 = $Goal2
@onready var sound_1 = $Sound1
@onready var sound_2 = $Sound2

func _on_body_entered(body):
	on_reset.emit()
	
