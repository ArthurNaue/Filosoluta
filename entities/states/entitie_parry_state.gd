extends State
class_name EntitieParryState

func state_physics_process(_delta: float) -> void:
	entitie.global_position.y += GameController.gravity

func state_entered() -> void:
	await get_tree().create_timer(0.2).timeout
	Transitioned.emit(self, "EntitieBlockState")
