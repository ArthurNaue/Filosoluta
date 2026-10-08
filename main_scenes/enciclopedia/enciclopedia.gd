extends Node2D

const MAIN_MENU_SCENE := "res://main_scenes/main_menu/main_menu.tscn"

var philosophers_data := [
	{
		"name": "SÓCRATES", "period": "Antiguidade • Atenas",
		"description": "Filósofo grego associado ao diálogo e ao questionamento, investigando virtude, conhecimento e justiça.",
		"skills": "Dialética Socrática: reflete o ataque por 0,1 s.\nQuestionar: projétil que causa 10 de dano.",
		"passive": "Só sei que nada sei: +15% de velocidade.", "stats": GameController.socrates
	},
	{
		"name": "SÃO TOMÁS DE AQUINO", "period": "Idade Média • Filosofia cristã",
		"description": "Filósofo medieval que articulou fé e razão na tradição escolástica.",
		"skills": "Fé e Razão: reduz dano recebido em 30% por 5 s.\nCausa primeira: mão divina causa 15 de dano.",
		"passive": "Proteção divina: chance de 1 em 5 de negar um ataque.", "stats": GameController.tomas_aquino
	},
	{
		"name": "RENÉ DESCARTES", "period": "Idade Moderna • França",
		"description": "Filósofo moderno conhecido pela dúvida metódica e pela busca de fundamentos seguros para o conhecimento.",
		"skills": "Dúvida metódica: imune e incapaz de atacar por 5 s.\nPenso, logo existo: teleporte para a frente.",
		"passive": "Plano cartesiano: pula 20% mais alto.", "stats": GameController.descartes
	},
	{
		"name": "FRIEDRICH NIETZSCHE", "period": "Contemporaneidade • Alemanha",
		"description": "Filósofo que criticou valores morais estabelecidos e explorou a criação de valores e a superação de si.",
		"skills": "Vontade de potência: +5 de dano nos ataques básicos.\nEterno retorno: recupera 10 de vida.",
		"passive": "Super-Homem: recebe 15% menos dano.", "stats": GameController.nietzsche
	},
]

func _ready() -> void:
	_build_interface()

func _build_interface() -> void:
	var background := TextureRect.new()
	background.texture = load("res://assets/images/backgrounds/background.png")
	background.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	background.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
	background.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	background.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(background)

	var overlay := ColorRect.new()
	overlay.color = Color(0.035, 0.035, 0.045, 0.86)
	overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(overlay)

	var ui := Control.new()
	ui.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(ui)

	var title := Label.new()
	title.text = "ENCICLOPÉDIA DOS FILÓSOFOS"
	title.position = Vector2(0, 5)
	title.size = Vector2(640, 27)
	title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	title.add_theme_font_size_override("font_size", 21)
	ui.add_child(title)

	var subtitle := Label.new()
	subtitle.text = "Conheça a história e as habilidades de cada lutador"
	subtitle.position = Vector2(0, 30)
	subtitle.size = Vector2(640, 18)
	subtitle.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	subtitle.add_theme_font_size_override("font_size", 10)
	subtitle.add_theme_color_override("font_color", Color(0.75, 0.75, 0.78))
	ui.add_child(subtitle)

	for i in philosophers_data.size():
		var col := i % 2
		var row := int(i / 2)
		_create_philosopher_card(ui, philosophers_data[i], Vector2(18 + col * 305, 52 + row * 137))

	var back_button := Button.new()
	back_button.text = "VOLTAR"
	back_button.position = Vector2(265, 333)
	back_button.size = Vector2(110, 22)
	back_button.pressed.connect(_on_back_pressed)
	ui.add_child(back_button)

func _create_philosopher_card(parent: Control, philosopher: Dictionary, card_position: Vector2) -> void:
	var panel := Panel.new()
	panel.position = card_position
	panel.size = Vector2(294, 130)
	parent.add_child(panel)

	var name_label := Label.new()
	name_label.text = philosopher.name
	name_label.position = Vector2(8, 4)
	name_label.size = Vector2(278, 20)
	name_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	name_label.add_theme_font_size_override("font_size", 13)
	panel.add_child(name_label)

	var period_label := Label.new()
	period_label.text = philosopher.period
	period_label.position = Vector2(8, 23)
	period_label.size = Vector2(278, 15)
	period_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	period_label.add_theme_font_size_override("font_size", 9)
	period_label.add_theme_color_override("font_color", Color(0.68, 0.68, 0.72))
	panel.add_child(period_label)

	var description := Label.new()
	description.text = philosopher.description
	description.position = Vector2(10, 39)
	description.size = Vector2(274, 31)
	description.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	description.add_theme_font_size_override("font_size", 9)
	panel.add_child(description)

	var skills := Label.new()
	skills.text = philosopher.skills
	skills.position = Vector2(10, 70)
	skills.size = Vector2(274, 36)
	skills.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	skills.add_theme_font_size_override("font_size", 8)
	panel.add_child(skills)

	var passive := Label.new()
	passive.text = "Passiva — " + philosopher.passive
	passive.position = Vector2(10, 106)
	passive.size = Vector2(274, 21)
	passive.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	passive.add_theme_font_size_override("font_size", 8)
	passive.add_theme_color_override("font_color", Color(0.83, 0.83, 0.86))
	panel.add_child(passive)

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file(MAIN_MENU_SCENE)
