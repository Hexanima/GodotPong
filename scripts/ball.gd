extends RigidBody2D

class_name Ball

@export var SPEED := 150.0

var x_direction := -1
var y_direction := -1

func _ready():
	contact_monitor = true
	max_contacts_reported = 2

func _physics_process(delta):
	linear_velocity = Vector2(x_direction * SPEED,y_direction * SPEED)
	pass
	
func change_direction():
	x_direction = -x_direction

func _on_body_entered(body):
	if body is Player:
		change_direction()
	if body is StaticBody2D:
		y_direction = -y_direction
