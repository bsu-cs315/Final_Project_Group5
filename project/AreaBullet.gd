extends Area2D

func _process(delta):  # Control movement of the bullet from here
	self.position.x = self.position.x + 0.3
