extends Node2D

var timeCount := 0
onready var playerHealth = get_child(1).health
func _ready():
	$TimeLeft.start()
	$TimeCounter.start()
func _process(_delta):
	if($TimeLeft.time_left >= 0):
		$HUD/Label.text = "Time Left: " + str(int($TimeLeft.time_left)) + "\nScore: " + str(timeCount)

func _on_TimeLeft_timeout():
	timeCount = timeCount + (100 * playerHealth)
	#win Screen or next Scene
	pass


func _on_TimeCounter_timeout():
	timeCount += 10
	pass # Replace with function body.
