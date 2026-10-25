extends Node2D

func _process(delta: float) -> void:
	if $dude.animation != "idle" and $dude.is_playing():
		print("not idle!")
		return
	if Input.is_action_pressed("ui_accept"):
		$AudioStreamPlayer2D.play()
		$dude.play("bounce")
		print("kick")
	else:
		$dude.play("idle")
		print("we idle")
