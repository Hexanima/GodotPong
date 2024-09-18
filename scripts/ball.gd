extends RigidBody2D

class_name Ball

@export var SPEED := 300.0
@onready var audio = $AudioStreamPlayer

var direction : Vector2 = Vector2(randf_range(-1.5,1.5),randf_range(-1.5,1.5)).normalized()

func play_sound():
	audio.pitch_scale = randf_range(0.75,1.25)
	audio.play()
	
func _ready():
	contact_monitor = true
	max_contacts_reported = 2
	play_sound()

func _physics_process(delta):
	linear_velocity = direction * SPEED
	pass
	
func change_direction():
	if direction.x < 0:
		direction = Vector2(randf_range(0.5,1.5),randf_range(0.5,1.5)).normalized()
	elif direction.x > 0:
		direction = Vector2(randf_range(-0.5,-1.5),randf_range(-0.5,-1.5)).normalized()

func _on_body_entered(body):
	if body is Player:
		change_direction()
		play_sound()
	if body is StaticBody2D:
		direction = Vector2(direction.x, 0 - direction.y)
		play_sound()
