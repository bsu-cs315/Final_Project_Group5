extends Node2D
const bulletFactory = preload("res://ThrowingStar.tscn")

const _spawnInterval = 3
var _spawnTimer = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_spawnTimer = _spawnTimer + delta
	if _spawnTimer >= _spawnInterval:
		print("time to spawn a bullet!")
		_spawnTimer = 0
		var bullet = bulletFactory.instance()
		self.add_child(bullet)
