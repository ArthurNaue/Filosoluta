extends State
class_name EntitieParryState

func state_entered() -> void:
	await get_tree().create_timer(1.0).timeout
	Transitioned.emit(self, str(stateMachine.previousState.name))
