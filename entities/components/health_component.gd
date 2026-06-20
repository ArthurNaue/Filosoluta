extends Node2D
class_name HealthComponent

@onready var entitie = get_parent()
@onready var entitieStats = entitie.entitieStats
@onready var health = entitieStats.health

func damage(amount: int) -> void:
	health -= amount
	
	if health <= 0:
		entitie.queue_free()
