extends State
class_name PlayerMovementState

@onready var moveSpeed = stats.moveSpeed

func state_physics_process(_delta: float) -> void:
	if Input.is_action_pressed("A"):
		entitie.global_position.x -= 10 * moveSpeed
	if Input.is_action_pressed("D"):
		entitie.global_position.x += 10 * moveSpeed
	if Input.is_action_just_pressed("W") and entitie.velocity.y == 0:
		entitie.global_position.y -= 100
	
	entitie.global_position.y += GameController.gravity

	if Input.is_action_just_pressed("F"):
		Transitioned.emit(self, "EntitieParryState")
