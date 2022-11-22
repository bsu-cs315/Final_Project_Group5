extends Area2D

func _ready():
	self.position.x = rand_range(250, 450)
	self.position.y = rand_range(200, 300)

func _process(delta):
	rotation_degrees =  rotation_degrees + (-delta * 360)


func bulletRemovalTrigger():
	self.queue_free()
