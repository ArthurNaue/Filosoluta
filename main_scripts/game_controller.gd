extends Node2D

var socrates = preload("res://entities/philosophers/socrates/socrates_stats.tres")
var nietzsche = preload("res://entities/philosophers/nietzsche/nitzsche_stats.tres")

var philosophers = [socrates, nietzsche]

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ESC"):
		get_tree().change_scene_to_file("res://main_scenes/main_menu/main_menu.tscn")
