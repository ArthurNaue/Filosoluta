extends Area2D
class_name HitboxComponent

@export var healthComponent: HealthComponent
@export var damageStats: DamageStats

@onready var entitie = get_parent()

func _ready() -> void:
	area_entered.connect(hitbox_collided)

func hitbox_collided(hitbox: HitboxComponent) -> void:
	var stateMachine = hitbox.entitie.get("entitieStateMachine")

	if stateMachine != null:
		print(str(stateMachine.currentState))
		if stateMachine.currentState is EntitieParryState:
			print("parry")
		else:
			print("colisao")
		hitbox.healthComponent.damage(damageStats.damageNumber)
