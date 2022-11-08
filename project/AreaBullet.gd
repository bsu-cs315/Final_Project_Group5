extends Area2D

var randomizedspeed = rand_range(200,600)

func _process(_delta):  # Control movement of the bullet from here
	self.position.x = self.position.x  + (randomizedspeed * _delta) 
	
	if(self.position.x >= 1000):
		self.position.x = -300
		randomizedspeed = rand_range(100,500)
		self.position.y = rand_range(190,415)
