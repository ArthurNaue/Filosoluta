extends Node2D

func _ready() -> void:
	var player1 = GameController.player1.instantiate()
	var player2 = GameController.player2.instantiate()

	# A seleção de personagem define os atributos e o retrato
	# antes dos nós entrarem na árvore, para que os @onready
	# dos componentes encontrem os dados corretos.
	player1.entitieStats = GameController.selected_player1_stats
	player2.entitieStats = GameController.selected_player2_stats
	player1.get_node("Sprite2D").texture = GameController.selected_player1_stats.sprite
	player2.get_node("Sprite2D").texture = GameController.selected_player2_stats.sprite

	player1.global_position = Vector2(80, 250)
	player2.global_position = Vector2(600, 250)
	player1.scale = Vector2(2, 2)
	player2.scale = Vector2(-2, 2)

	add_child(player1)
	add_child(player2)
