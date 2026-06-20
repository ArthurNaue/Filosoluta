extends CharacterBody2D
class_name EnemyBullet

func _physics_process(_delta: float):
	global_position.x -= 5
	
	move_and_slide()
