extends Node2D

onready var timer = get_node("Prologue")


func _on_Start_pressed():
	$TimePerLetter.start()
	$Title.visible = false
	$Start.visible = false
	pass # Replace with function body.


func _on_TimePerLetter_timeout():
	timer.visible_characters += 1
	if(timer.visible_characters == 1):  # revert to 260 when not testing
		get_tree().change_scene("res://Scenes/Level2.tscn")
	
	
	
