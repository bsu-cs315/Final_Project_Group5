extends Node2D

var timeCount := 0
onready var player = get_child(3)
onready var _HUD = get("res://HUD.tscn")

func _ready():
	randomize()
	$TimeLeft.start()
	$TimeCounter.start()
	
func _process(_delta):
	position.x = get_viewport_rect().size.x/6
	if($TimeLeft.time_left >= 0):
		$HUD/Label.text = "Time Left: " + str(int($TimeLeft.time_left)) + "\nScore: " + str(timeCount) + "\n Health : " + str(player.health)

func _on_TimeLeft_timeout():
	timeCount = timeCount + (100 * player.health)
	$TimeCounter.stop()
	#win Screen or next Scene
	pass
	
func _on_TimeCounter_timeout():
	timeCount += 10
	pass # Replace with function body.
