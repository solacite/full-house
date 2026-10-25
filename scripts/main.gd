extends Node2D

@onready var dude: AudioStreamPlayer2D = $"dude kick"

@export var kick: AudioStream
@export var kick_four: AudioStream

func _process(_delta: float) -> void:
	# kick dude anim
	if $dude.animation != "idle" and $dude.is_playing():
		return
	if Input.is_action_pressed("ui_accept"):
		dude.stream = kick
		dude.play()
		$dude.play("bounce")
	else:
		$dude.play("idle")


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if $dude.animation == "bounce four":
			$dude.play("idle")
			dude.stop()
		else:
			dude.stream = kick_four
			dude.play()
			$dude.play("bounce four")
