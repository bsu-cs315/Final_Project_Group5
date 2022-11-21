extends KinematicBody2D

onready var sprite = get_node("Sprite")
onready var activeTexture = sprite.get_texture()
onready var transparentTexture = load("res://sprites/transparent_pixel.png")

var _velocity : Vector2 = Vector2.ZERO
var _speed : int = 150
var hit : bool = false
var health : int = 3
var _invulnerabilityTimer = 0
var _invulnerabilityFlashTimer = 0.2

#onready var vulnerability = get_node("AfterTime")

func _physics_process(_delta):
	var input := Vector2.ZERO
	input.x = Input.get_axis("move_left", "move_right")
	input.y = Input.get_axis("move_up", "move_down")
	_velocity.x = input.x * _speed
	_velocity.y = input.y * _speed
	
	_velocity = move_and_slide(_velocity, Vector2.UP)
	
	rotatePlayer(input)


func _process(delta):
	
	if _invulnerabilityTimer > 0:
		_invulnerabilityTimer = _invulnerabilityTimer - delta
		_invulnerabilityFlashTimer = _invulnerabilityFlashTimer - delta
		if _invulnerabilityFlashTimer <= 0:
			_invulnerabilityFlashTimer = 0.2
			if sprite.get_texture() == activeTexture:
				sprite.set_texture(transparentTexture)
			else:
				sprite.set_texture(activeTexture)
	elif not _invulnerabilityTimer == -1: # this is essentially a weird way of saying if timer <= 0 while excluding -1 from that check, see why below
		_invulnerabilityTimer = -1
		sprite.set_texture(activeTexture)
		

func _on_Area2D_area_entered(area):  # new method of doing bullet collision: make bullets area2D and have the player's area2D node send a signal to the player when it collides with the bullets area2D node. In other words, the player is responsible for bullet collision, not the bullet itself.
	if area.is_in_group("Bullets"):
		if _invulnerabilityTimer <= 0:
			health = health - 1
			print("Player HP: " + str(health))
			_invulnerabilityTimer = 3
		else:
			print("Still invulnerable!")
		
		#set_collision_layer_bit(2,false)
		#set_collision_mask_bit(2,false)
		#vulnerability.start()
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


#func _on_AfterTime_timeout():
#	collision_layer = 1
#	collision_mask = 1
