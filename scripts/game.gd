extends Node2D

@onready var ball = $Ball
var newBall = preload("res://scenes/ball.tscn")
@onready var player_1 = $Player1
@onready var player_2 = $Player2
@onready var score_1 = $Score1
@onready var score_2 = $Score2

var _p1_in_pos
var _p2_in_pos
# Called when the node enters the scene tree for the first time.
func _ready():
	_p1_in_pos = player_1.position.x
	_p2_in_pos = player_2.position.x
	score_1.text = str(player_1.score)
	score_2.text = str(player_2.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func reset_ball():
	ball.queue_free()
	ball = newBall.instantiate()
	add_child(ball)
	
func display_scores():
	print("PLAYER 1: " + str(player_1.score))
	print("PLAYER 2: " + str(player_2.score))
	
func _process(delta):
	if player_1.position.x != _p1_in_pos:
		player_1.position.x = _p1_in_pos
	if player_2.position.x != _p2_in_pos:
		player_2.position.x = _p2_in_pos
	if Input.is_action_just_pressed("reset"):
		reset_ball()

func _on_goal_1_on_reset():
	player_2.score += 1
	score_2.text = str(player_2.score)
	reset_ball()

func _on_goal_2_on_reset():
	player_1.score += 1
	score_1.text = str(player_1.score)
	reset_ball()
