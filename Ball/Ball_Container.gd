extends Node2D

onready var Ball = load("res://Ball/Ball.tscn")

func _ready():
	pass
func _physics_process(_delta):
	if get_child_count() == 0:
		Global.update_lives(-1)
		Global.update_fever(-Global.fever)
		make_ball_1()
		#make_ball_2()

func make_ball_1():
	var ball_1 = Ball.instance()
	ball_1.global_position = Vector2(Global.VP.x, Global.VP.y - 110)
	var direction_1 = Vector2(250,-250) if randf() > 0.5 else Vector2(-250,-250)
	ball_1.initial_velocity = direction_1
	ball_1.released = false
	add_child(ball_1)
	
#func make_ball_2():
	#var ball_2 = Ball.instance()
	#ball_2.global_position = Vector2(global_position.x, global_position.y + 110)
	#var direction_2 = Vector2(250,-250) if randf() > 0.5 else Vector2(-250,-250)
	#ball_2.initial_velocity = direction_2
	#ball_2.released = false
	#add_child(ball_2)
	

func make_ball_fever():
	var ball_1 = Ball.instance()
	ball_1.global_position = Vector2(randf() * (Global.VP.x - 50) + 50, Global.VP.y - 110)
	var direction_1 = Vector2(250,-250) if randf() > 0.5 else Vector2(-250,-250)
	ball_1.apply_central_impulse(direction_1)
	add_child(ball_1)
