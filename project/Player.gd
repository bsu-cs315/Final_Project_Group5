extends KinematicBody2D

var _velocity : Vector2 = Vector2.ZERO
var _speed : int = 150
var hit : bool = false
var health : int = 3

func _physics_process(_delta):
	var input := Vector2.ZERO
	input.x = Input.get_axis("move_left", "move_right")
	input.y = Input.get_axis("move_up", "move_down")
	_velocity.x = input.x * _speed
	_velocity.y = input.y * _speed
	
	_velocity = move_and_slide(_velocity, Vector2.UP)
	
	rotatePlayer(input)
		
	
	for i in get_slide_count():  # I propose we deprecate this method of bullet collision in favor of the one below using signals.
		var collision := get_slide_collision(i)
		if collision.collider.is_in_group("Bullets") and hit == false:
			hit = true
			print("1")
		#if collision.collider.is_in_group("Wall"):  # commented this out for ease of testing
		#	_speed = 100


func _on_Area2D_area_entered(area):  # new method of doing bullet collision: make bullets area2D and have the player's area2D node send a signal to the player when it collides with the bullets area2D node. In other words, the player is responsible for bullet collision, not the bullet itself.
	print("Collided with area2D node: '" + str(area) + "'!")
	if area.is_in_group("Bullets"):
		print("The Area2D I just collided with was in the 'Bullets' group!")
		health = health - 1
		print("Player HP: " + str(health))
		if(health == 0):
			get_tree().change_scene("res://Scenes/ReAwakening.tscn")
	else:
		print("The Area2D I just collided with was NOT in the 'Bullets' group, so I wont subtract health!")


func rotatePlayer(input : Vector2):
	if(input.x < 0 and Input.get_axis("move_left","move_right")):
		rotation_degrees = -90
	if(input.x > 0 and Input.get_axis("move_left","move_right")):
		rotation_degrees = 90
	if(input.y < 0 and Input.get_axis("move_down","move_up")):
		rotation_degrees = 0
	if(input.y > 0 and Input.get_axis("move_down", "move_up")):
		rotation_degrees = 180
