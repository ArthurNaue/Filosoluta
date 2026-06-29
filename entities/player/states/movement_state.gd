extends State
class_name PlayerMovementState

@onready var moveSpeed = stats.moveSpeed
var gravity = 8

func state_physics_process(_delta: float) -> void:
	if Input.is_action_pressed("A") && entitie.global_position.x >= 20:
		entitie.global_position.x -= 10 * moveSpeed
	if Input.is_action_pressed("D") && entitie.global_position.x <= 320:
		entitie.global_position.x += 10 * moveSpeed
	if Input.is_action_just_pressed("SPACE") and entitie.global_position.y >= 133:
		entitie.global_position.y -= 100
	
	if entitie.global_position.y < 134:
		entitie.global_position.y += gravity

	if Input.is_action_just_pressed("F"):
		Transitioned.emit(self, "EntitieParryState")
