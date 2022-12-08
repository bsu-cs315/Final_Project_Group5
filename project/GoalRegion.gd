extends Area2D

var AreaTimer = 5
var isActive = false

func _ready():
	pass # Replace with function body.

func _process(delta):
	if isActive == true:
		AreaTimer = AreaTimer - delta
		print(AreaTimer)
	if AreaTimer <= 0:
		get_tree().change_scene("res://EndGame.tscn")
		# send win signal

func _on_Area2D_area_entered(area):
	isActive = true



func _on_Area2D_area_exited(area):
	isActive = false

