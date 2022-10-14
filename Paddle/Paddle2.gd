extends KinematicBody2D

var target = Vector2(340,280)
export var speed = 10.0
var width = 0
var width_default = 0
var decay = 0.02

onready var Ball = get_node_or_null("/root/Game/Ball")

func _ready():
	width = $CollisionShape2D.get_shape().get_extents().x
	width_default = width
	target = Vector2(340,280)

func _physics_process(_delta):
	target.x = clamp(target.x, 0, Global.VP.x - 2*width)
	position = target
	for c in $Powerups.get_children():
		c.payload()

#func _input(event):
	#if event is InputEventMouseMotion:
		#target.x += event.relative.x

func hit(_ball):
	pass

func powerup(payload):
	for c in $Powerups.get_children():
		if c.type == payload.type:
			c.queue_free()
	$Powerups.call_deferred("add_child", payload)
