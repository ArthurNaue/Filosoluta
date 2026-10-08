extends Node2D

const MAIN_GAME_SCENE := "res://main_scenes/main_game/main.tscn"

var characters := [
	{"name": "SÓCRATES", "description": "Antiguidade • Dialética e questionamento", "stats": GameController.socrates},
	{"name": "TOMÁS DE AQUINO", "description": "Idade Média • Fé e razão", "stats": GameController.tomas_aquino},
	{"name": "DESCARTES", "description": "Idade Moderna • Dúvida metódica", "stats": GameController.descartes},
	{"name": "NIETZSCHE", "description": "Contemporaneidade • Vontade de potência", "stats": GameController.nietzsche},
]
var player1_index := 0
var player2_index := 3
var player1_preview: TextureRect
var player2_preview: TextureRect
var player1_stats: Label
var player2_stats: Label
var player1_buttons: Array[Button] = []
var player2_buttons: Array[Button] = []

func _ready() -> void:
	_build_interface()
	_update_selection()

func _build_interface() -> void:
	var ui := Control.new()
	ui.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(ui)

	var title := Label.new()
	title.text = "SELEÇÃO DE PERSONAGEM"
	title.position = Vector2(0, 18)
	title.size = Vector2(640, 34)
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_font_size_override("font_size", 24)
	ui.add_child(title)

	var subtitle := Label.new()
	subtitle.text = "Escolha os dois filósofos que irão para o duelo"
	subtitle.position = Vector2(0, 50)
	subtitle.size = Vector2(640, 22)
	subtitle.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	subtitle.add_theme_color_override("font_color", Color(0.75, 0.75, 0.78))
	ui.add_child(subtitle)

	var player1_card := _create_character_card(ui, "JOGADOR 1", Vector2(38, 82), true)
	player1_preview = player1_card.preview
	player1_stats = player1_card.stats_label

	var player2_card := _create_character_card(ui, "OPONENTE", Vector2(330, 82), false)
	player2_preview = player2_card.preview
	player2_stats = player2_card.stats_label

	var confirm_button := Button.new()
	confirm_button.text = "CONFIRMAR"
	confirm_button.position = Vector2(260, 326)
	confirm_button.size = Vector2(110, 26)
	confirm_button.pressed.connect(_on_confirm_pressed)
	ui.add_child(confirm_button)

	var hint := Label.new()
	hint.text = "Escolha um filósofo em cada lado e confirme para iniciar"
	hint.position = Vector2(0, 300)
	hint.size = Vector2(640, 20)
	hint.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	hint.add_theme_font_size_override("font_size", 11)
	hint.add_theme_color_override("font_color", Color(0.62, 0.62, 0.66))
	ui.add_child(hint)

func _create_character_card(parent: Control, player_title: String, position: Vector2, is_player_one: bool) -> Dictionary:
	var panel := Panel.new()
	panel.position = position
	panel.size = Vector2(272, 210)
	parent.add_child(panel)

	var title := Label.new()
	title.text = player_title
	title.position = Vector2(0, 10)
	title.size = Vector2(272, 22)
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_font_size_override("font_size", 15)
	panel.add_child(title)

	var preview := TextureRect.new()
	preview.position = Vector2(88, 40)
	preview.size = Vector2(96, 96)
	preview.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	preview.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	panel.add_child(preview)

	var buttons: Array[Button] = []
	for i in characters.size():
		var character_button := Button.new()
		character_button.text = characters[i].name
		character_button.position = Vector2(18 + (i % 2) * 120, 140 + int(i / 2) * 30)
		character_button.size = Vector2(116, 27)
		character_button.add_theme_font_size_override("font_size", 11)
		character_button.pressed.connect(_on_character_selected.bind(is_player_one, i))
		panel.add_child(character_button)
		buttons.append(character_button)

	var stats_label := Label.new()
	stats_label.position = Vector2(12, 200)
	stats_label.size = Vector2(248, 28)
	stats_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	stats_label.add_theme_font_size_override("font_size", 11)
	stats_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	panel.add_child(stats_label)

	if is_player_one:
		player1_buttons = buttons
	else:
		player2_buttons = buttons

	return {
		"preview": preview,
		"stats_label": stats_label,
	}

func _update_selection() -> void:
	var character1 = characters[player1_index]
	var character2 = characters[player2_index]

	player1_preview.texture = character1.stats.sprite
	player1_stats.text = _format_stats(character1.stats, character1.description)
	_update_button_state(player1_buttons, player1_index)

	player2_preview.texture = character2.stats.sprite
	player2_stats.text = _format_stats(character2.stats, character2.description)
	_update_button_state(player2_buttons, player2_index)

func _format_stats(stats: EntitieStats, description: String) -> String:
	return "%s\nVida: %d   Velocidade: %d" % [description, stats.health, stats.moveSpeed]

func _on_character_selected(is_player_one: bool, index: int) -> void:
	if is_player_one:
		player1_index = index
	else:
		player2_index = index
	_update_selection()

func _update_button_state(buttons: Array[Button], selected_index: int) -> void:
	for i in buttons.size():
		buttons[i].disabled = i == selected_index

func _on_confirm_pressed() -> void:
	GameController.selected_player1_stats = characters[player1_index].stats
	GameController.selected_player2_stats = characters[player2_index].stats
	get_tree().change_scene_to_file(MAIN_GAME_SCENE)
