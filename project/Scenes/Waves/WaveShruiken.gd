extends Node2D
const bulletFactory = preload("res://Scenes/Bullets/ThrowingStar.tscn")

const _spawnInterval = 0.005
var _spawnTimer = 0
var waveOrigin

func _ready():
	waveOrigin = get_parent().get_transform()  # this gets the location of the center of the arena.


func _process(delta):
	_spawnTimer = _spawnTimer + delta
	if _spawnTimer >= _spawnInterval:
		_spawnTimer = 0
		var bullet = bulletFactory.instance()
		self.add_child(bullet)
