extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var _speed := 600
var _velocity := Vector2.ZERO 
var check = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	_velocity.x = _speed 

func _process(_delta):
	_velocity = move_and_slide(_velocity, Vector2.UP)
	
	if(position.x >= 674 or position.x <= 16):
		_velocity.x = _velocity.x * -1
		
	if((position.x > 340 and position.x < 360) and Input.is_action_just_pressed("reAwaken")):
		_velocity.x = 0
		visible = false
		check = 1
		$ExitScene.start()

func _on_ExitScene_timeout():
	get_tree().change_scene("res://Scenes/World.tscn")
