extends Node2D
class_name StateMachine

@export var initialState: State

var currentState: State
var previousState: State
var states: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(on_child_transitioned)
	
	if initialState:
		initialState.state_entered()
		currentState = initialState

func _process(_delta: float) -> void:
	if currentState:
		currentState.state_process(_delta)

func _physics_process(_delta: float) -> void:
	if currentState:
		currentState.state_physics_process(_delta)

func on_child_transitioned(state, newStateName):
	if state != currentState:
		return
	
	var newState = states.get(newStateName.to_lower())
	if !newState:
		return
	
	if currentState:
		currentState.state_exited()
	
	previousState = state
	currentState = newState
	
	newState.state_entered()
