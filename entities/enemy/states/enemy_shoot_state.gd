extends State
class_name EnemyShootState

@export var enemyBulletScene: PackedScene
@export var bulletSpawnTimer: Timer

func state_entered() -> void:
	bulletSpawnTimer.timeout.connect(spawn_bullet)

func state_process(_delta: float) -> void:
	if Input.is_action_just_pressed("X"):
		Transitioned.emit(self, "EnemyFollowState")

func spawn_bullet():
	var enemyBullet = enemyBulletScene.instantiate()
	add_child(enemyBullet)
