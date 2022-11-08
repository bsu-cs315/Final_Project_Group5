extends Node2D

onready var bullet := get_node("Bullet")

func _ready():
	$startWave.start()
func _physics_process(_delta):
	$Bullet.target = $Player.position


func _on_startWave_timeout():
	add_child(bullet)
	bullet.position.x = rand_range(0, 600)
