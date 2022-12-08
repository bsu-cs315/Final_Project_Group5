extends Area2D

var _playerPosition = Vector2(0,0)
var _launchVector = Vector2(0,0)
var _arrowVelocity = 3.2


func _ready():
	_playerPosition = get_parent().player.position
	
	self.position.x = rand_range(200, 400)
	self.position.y = rand_range(200, 400)
	
	
	rotation = get_angle_to(_playerPosition)
	
	_launchVector = self.position - _playerPosition
	_launchVector = _launchVector.normalized()
	
	
func _process(_delta):
	self.position = self.position - _launchVector * _arrowVelocity



func bulletRemovalTrigger():
	self.queue_free()
