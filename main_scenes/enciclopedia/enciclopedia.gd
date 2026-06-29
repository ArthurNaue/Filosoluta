extends Node2D

func _ready():
	for philosofer in GameController.philosophers:
		var philosoferImage = Sprite2D.new()
		philosoferImage.texture = philosofer.sprite
		philosoferImage.global_position = Vector2(300, 300)
		add_child(philosoferImage)

func _on_voltar_button_pressed():
	get_tree().change_scene_to_file("res://main_scenes/main_menu/main_menu.tscn")
