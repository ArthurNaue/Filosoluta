extends State
class_name EntitieBlockState

@export var hitbox: HitboxComponent
@onready var moveSpeed = stats.moveSpeed

func state_process(_delta: float) -> void:
	if !Input.is_action_pressed("F"):
		Transitioned.emit(self, "PlayerMovementState")

func state_physics_process(_delta: float) -> void:
	if Input.is_action_pressed("A"):
		entitie.global_position.x -= 10 * moveSpeed/3
	if Input.is_action_pressed("D"):
		entitie.global_position.x += 10 * moveSpeed/3
	if Input.is_action_just_pressed("W") and entitie.velocity.y == 0:
		entitie.global_position.y -= 100/3
	entitie.global_position.y += GameController.gravity
