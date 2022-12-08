extends Area2D

var origin  # This is passed in from the wave that generates this bullet.
var targetAngle  # This is passed in from the wave that generates this bullet.
var speed = 1.8


func _process(delta):
	rotation_degrees = rotation_degrees + (-delta * 360)
	self.position.x = self.position.x + speed * cos(targetAngle)
	self.position.y = self.position.y + speed * sin(targetAngle)

func bulletRemovalTrigger():
	self.queue_free()
