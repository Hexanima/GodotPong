extends Node2D

@onready var ball = $Ball
var newBall = preload("res://scenes/ball.tscn")
@onready var player_1 = $Player1
@onready var player_2 = $Player2

var _p1_in_pos
var _p2_in_pos
# Called when the node enters the scene tree for the first time.
func _ready():
	_p1_in_pos = player_1.position.x
	_p2_in_pos = player_2.position.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player_1.position.x != _p1_in_pos:
		print("UNO MOVIO")
		player_1.position.x = _p1_in_pos
	if player_2.position.x != _p2_in_pos:
		print("DOS MOVIO")
		player_2.position.x = _p2_in_pos
	if Input.is_action_just_pressed("reset"):
		ball.queue_free()
		ball = newBall.instantiate()
		
		add_child(ball)
