extends Node2D

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_scenes/main.tscn")

func _on_enciclopedia_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_scenes/enciclopedia/enciclopedia.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit()
