extends Area2D

var origin
var targetAngle
var speed = 1
	

func _ready():
#	var origin = get_parent().waveOrigin[2]
#	origin.x = origin.x + 96  # this accounts for the offset of the arena, its actual origin is in the left wall, this puts it in the center.
#
#	var _randomAngle = rand_range(0,360)
#	var _randomDistance = rand_range(150, 280)
#
#	self.position.x = origin.x + _randomDistance * cos(deg2rad(_randomAngle))
#	self.position.y = origin.y + _randomDistance * sin(deg2rad(_randomAngle))
	pass



func _process(delta):
	rotation_degrees = rotation_degrees + (-delta * 360)
	self.position.x = self.position.x + speed * cos(targetAngle)
	self.position.y = self.position.y + speed * sin(targetAngle)

func bulletRemovalTrigger():
	self.queue_free()
