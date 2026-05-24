extends Node2D


func _ready():
	
	$draw_area.text = ""
	print("ready")
	
#	https://docs.godotengine.org/en/4.4/getting_started/step_by_step/signals.html#connecting-a-signal-via-code
	for node in $".".get_children():
		if node.is_in_group("kana"):
			print(node)
			var button: Button = node
			var text = button.text
			button.pressed.connect(_on_katakana_button_down.bind(text))
		pass
	

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://node_2d.tscn")




func _on_katakana_button_down(text) -> void:
	$AudioStreamPlayer.volume_db = 10.0
	
	var mp3_path = "res://assets/shorts/kana_lesson/" + text+ ".mp3"
	print(mp3_path)

	$AudioStreamPlayer.stream = load(mp3_path)
	$AudioStreamPlayer.play()
	
	$draw_area.text = text
	
	pass # Replace with function body.


func _on_katakana_2_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")

	pass # Replace with function body.
