extends Node2D

var socrates = preload("res://entities/philosophers/socrates/socrates_stats.tres")
var nietzsche = preload("res://entities/philosophers/nietzsche/nitzsche_stats.tres")
var tomas_aquino = preload("res://entities/philosophers/tomas_aquino/tomas_aquino_stats.tres")
var descartes = preload("res://entities/philosophers/descartes/descartes_stats.tres")
var player1 = preload("res://entities/player/player.tscn")
var player2 = preload("res://entities/enemy/enemy.tscn")

var selected_player1_stats = socrates
var selected_player2_stats = nietzsche
var philosophers = [socrates, tomas_aquino, descartes, nietzsche]
var gravity = 8

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ESC"):
		get_tree().change_scene_to_file("res://main_scenes/main_menu/main_menu.tscn")
