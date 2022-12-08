extends Node2D

onready var timer = get_node("Prologue")


func _on_Start_pressed():
	$TimePerLetter.start()
	$Button.visible = true
	$Title.visible = false
	$Start.visible = false


func _on_TimePerLetter_timeout():
	timer.visible_characters += 1
	if(timer.visible_characters == 260):  # revert to 260 when not testing
		get_tree().change_scene("res://Scenes/World.tscn")
	
	
	


func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")
	pass # Replace with function body.
