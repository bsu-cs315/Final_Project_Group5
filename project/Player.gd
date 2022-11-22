extends KinematicBody2D

onready var sprite = get_node("Sprite")
onready var activeTexture = sprite.get_texture()
onready var transparentTexture = load("res://sprites/transparent_pixel.png")
onready var playerSound = get_node("AudioStreamPlayer")

var _velocity : Vector2 = Vector2.ZERO
var _speed : int = 150
var health : int = 10

const _invulnerabilityPeriod = 2  # The length of time the player will be invulnerable for after taking damage, in seconds.
const _invulnerabilityFlashPeriod = 0.2
var _invulnerabilityTimer = 0  # The variable used to actually keep track of invulnerability
var _invulnerabilityFlashTimer = 0.2

signal playerDamaged(bullet)  # Used to send a signal back to a bullet which has damaged a player to tell it to remove itself

#func _ready():
#	print(self)

func _physics_process(_delta):
	var input := Vector2.ZERO
	input.x = Input.get_axis("move_left", "move_right")
	input.y = Input.get_axis("move_up", "move_down")
	_velocity.x = input.x * _speed
	_velocity.y = input.y * _speed
	
	_velocity = move_and_slide(_velocity, Vector2.UP)
	
	rotatePlayer(input)


func _process(delta):
	if _invulnerabilityTimer > 0:  # This handles the invulnerability timer and flashing sprite during said timer.
		_invulnerabilityTimer = _invulnerabilityTimer - delta
		_invulnerabilityFlashTimer = _invulnerabilityFlashTimer - delta
		if _invulnerabilityFlashTimer <= 0:
			_invulnerabilityFlashTimer = 0.2
			if sprite.get_texture() == activeTexture:
				sprite.set_texture(transparentTexture)
			else:
				sprite.set_texture(activeTexture)
	elif not _invulnerabilityTimer == -1: # this is essentially a weird way of saying if timer <= 0 while excluding -1 from that check. I use -1 as a value which cant be reached in 1 frame. If the timer is <= 0 but NOT negative 1, the player sprite is reset back to its original sprite and the timer is set to -1. This way we dont have to check EVERY FRAME to see what the sprite texture is.
		_invulnerabilityTimer = -1
		sprite.set_texture(activeTexture)
		

func _on_Area2D_area_entered(area):  # new method of doing bullet collision: make bullets area2D and have the player's area2D node send a signal to the player when it collides with the bullets area2D node. In other words, the player is responsible for bullet collision, not the bullet itself.
	if area.is_in_group("Bullets"):
		if _invulnerabilityTimer <= 0:
			playerSound.playing = true
			health = health - 1
			_invulnerabilityTimer = _invulnerabilityPeriod  # Initiates the player invulnerability time. Length of invulnerability is handled in _process()
			_invulnerabilityFlashTimer = _invulnerabilityFlashPeriod
			connect("playerDamaged", area, "bulletRemovalTrigger")  # connects to the specific bullet that damaged the player
			emit_signal("playerDamaged")  # sends bullet removal signal to the bullet that did damage
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
