extends Node2D

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ESC"):
		get_tree().change_scene_to_file("res://main_scenes/main_menu.tscn")
