extends Node

@onready var bullet = preload("res://Scenes/bullet.tscn")

func spawnBullet(pos: Vector2 = Vector2(0,0)):
	var bulletInstance = bullet.instantiate()
	bulletInstance.position = pos
	get_parent().add_child.call_deferred(bulletInstance)

func _on_timeout() -> void:
	spawnBullet()
