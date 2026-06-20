extends State
class_name EnemyFollowState

@onready var moveSpeed = stats.moveSpeed

var player: CharacterBody2D

func state_entered() -> void:
	player = get_tree().get_first_node_in_group("player")

func state_physics_process(_delta: float) -> void:
	if player.global_position.x >= entitie.global_position.x:
		entitie.global_position.x += 10 * moveSpeed
	if player.global_position.x <= entitie.global_position.x:
		entitie.global_position.x -= 10 * moveSpeed

func state_process(_delta: float) -> void:
	if Input.is_action_just_pressed("X"):
		Transitioned.emit(self, "EnemyShootState")
