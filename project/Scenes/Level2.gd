extends Node2D

onready var _HUD = get_node("HUD")
onready var player = get_node("Player")

func _ready():
	randomize()

func _process(_delta):
	_HUD.get_node("Label").text = "Health : " + str(player.health)
