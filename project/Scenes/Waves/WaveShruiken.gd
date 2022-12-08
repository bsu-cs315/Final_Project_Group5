extends Node2D
const bulletFactory = preload("res://Scenes/Bullets/ThrowingStar.tscn")

const _spawnInterval = 1
var _spawnTimer = 0
var waveOrigin

func _ready():
	waveOrigin = get_parent().get_transform()  # this gets the location of the center of the arena.


func _process(delta):
	_spawnTimer = _spawnTimer + delta
	if _spawnTimer >= _spawnInterval:
		_spawnTimer = 0
		var target = Vector2(rand_range(-96, 96), rand_range(-96, 96))
		var spread = 30
		var _randomAngle = rand_range(0,360)
		var _randomDistance = rand_range(150, 280)
		
		for i in range (0, 3):
			var bullet = bulletFactory.instance()
		
			bullet.origin = waveOrigin[2]
			bullet.origin.x = bullet.origin.x + 96
			
			bullet.position.x = bullet.origin.x + _randomDistance * cos(deg2rad(_randomAngle))
			bullet.position.y = bullet.origin.y + _randomDistance * sin(deg2rad(_randomAngle))
			
			var targetAngle = bullet.get_angle_to(bullet.origin + target)
			targetAngle = targetAngle - deg2rad(spread/3)
			bullet.targetAngle = targetAngle + (i * deg2rad(spread/3))
		
			self.add_child(bullet)
