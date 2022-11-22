extends Node2D

func _process(_delta):
	if($OverlayButton.check == 1):
		$Before.visible = false
		$After.visible = true
