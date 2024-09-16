extends CharacterBody2D

class_name Player

@export var SPEED = 300.0

@export var UP : StringName = "p1_up"
@export var DOWN : StringName = "p1_down"

var score = 0

func _physics_process(delta):
	var direction = Input.get_axis(UP, DOWN)
	
	velocity.y = direction * SPEED
	
	move_and_slide()
