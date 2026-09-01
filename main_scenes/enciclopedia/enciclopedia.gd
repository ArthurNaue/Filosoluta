extends Node2D

func _ready():
	var position = Vector2(32, 32)
	
	for philosofer in GameController.philosophers:
		var philosoferImage = Sprite2D.new()
		philosoferImage.texture = philosofer.sprite
		philosoferImage.global_position = position
		add_child(philosoferImage)
		position.x += 64

func _on_voltar_button_pressed():
	get_tree().change_scene_to_file("res://main_scenes/main_menu/main_menu.tscn")
