extends Node2D

const bulletFactory = preload("res://Scenes/Bullets/Arrow.tscn")

const _spawnInterval = 1
var _spawnTimer = 0

var player

func _ready():
	var level = get_parent().get_parent()
	player = level.get_node("Player")
#	print(player)
#	print(player.position.x)

func _process(delta):
	_spawnTimer = _spawnTimer + delta
	if _spawnTimer >= _spawnInterval:
		_spawnTimer = 0
		var bullet = bulletFactory.instance()
		self.add_child(bullet)
