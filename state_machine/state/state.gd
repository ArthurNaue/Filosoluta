extends Node2D
class_name State

signal Transitioned

@onready var stateMachine = get_parent()
@onready var entitie = stateMachine.get_parent()
@onready var stats = entitie.entitieStats

func state_entered() -> void:
	pass

func state_process(_delta: float) -> void:
	pass

func state_physics_process(_delta: float) -> void:
	pass

func state_exited() -> void:
	pass
