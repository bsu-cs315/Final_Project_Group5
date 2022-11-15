extends Control

onready var screen = load("res://Scenes/World.tscn")
var pause = false

func _on_Button_pressed():
	if(pause == false):
		pause = true
		screen.paused
	if(pause == true):
		pause = false

