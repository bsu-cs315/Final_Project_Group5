extends Area2D

var randomized = rand_range(0.5,1.5)

func _process(delta):  # Control movement of the bullet from here
	self.position.x = self.position.x  + randomized
