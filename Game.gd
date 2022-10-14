extends Node2D

export var margin_1 = Vector2(150,200)
export var index = Vector2(140,100)

func _ready():
	if Global.level < 0 or Global.level >= len(Levels.levels):
		Global.end_game(true)
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		var level = Levels.levels[Global.level]
		var layout_1 = level["layout_1"]
		var layout_2 = level["layout_2"]
		var Brick_Container = get_node_or_null("/root/Game/Brick_Container")
		Global.time = level["timer"]
		if Brick_Container != null:
			var Brick = load("res://Brick/Brick.tscn")
			for rows in range(len(layout_1)):
				for cols in range(len(layout_1[rows])):
					if layout_1[rows][cols] > 0:
						var brick = Brick.instance()
						brick.new_position = Vector2(margin_1.x + index.x*cols, margin_1.y + index.y*rows)
						brick.position = Vector2(brick.new_position.x,-300)
						brick.score = layout_1[rows][cols]
						Brick_Container.add_child(brick)
			#for rows in range(len(layout_2)):
				#for cols in range(len(layout_2[rows])):
					#if layout_2[rows][cols] > 0:
						#var brick = Brick.instance()
						#brick.new_position = Vector2(margin_2.x + index.x*cols,margin_2.y + index.y*rows)
						#brick.position = Vector2(brick.new_position.x,-100)
						#brick.score = layout_2[rows][cols]
						#Brick_Container.add_child(brick)
		var Instructions = get_node_or_null("/root/Game/UI/Instructions")
		if Instructions != null:
			Instructions.set_instructions(level["name"],level["instructions"])
	$Paddle_Container/Paddle1.show()
