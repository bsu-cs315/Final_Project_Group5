extends Area2D
func _process(delta):
	rotation_degrees =  rotation_degrees + (-delta * 360)

