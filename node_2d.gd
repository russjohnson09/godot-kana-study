extends Node2D




func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()


func _on_timer_timeout() -> void:
	$Intro.play()
	pass # Replace with function body.
