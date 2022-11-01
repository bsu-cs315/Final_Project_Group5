extends KinematicBody2D

var _velocity : Vector2 = Vector2.ZERO
var _speed : int = 150

func _physics_process(delta):
	var input := Vector2.ZERO
	input.x = Input.get_axis("move_left", "move_right")
	input.y = Input.get_axis("move_up", "move_down")
	_velocity.x = input.x * _speed
	_velocity.y = input.y * _speed
	
	_velocity = move_and_slide(_velocity, Vector2.UP)
