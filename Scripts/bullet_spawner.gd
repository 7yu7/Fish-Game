extends Node

@onready var bullet = preload("res://Scenes/bullet.tscn")

var screen

func _ready() -> void:
	screen = get_viewport().get_visible_rect().size

func spawnBullet(pos: Vector2 = Vector2(0,0)):
	var bulletInstance = bullet.instantiate()
	bulletInstance.position = pos
	get_parent().add_child.call_deferred(bulletInstance)

func _on_timeout() -> void:
	var bulletPos = Vector2(0,0)
	var rand = randi() % 4
	if rand == 0:
		bulletPos = Vector2(-screen.x/2, randf_range(-screen.y/2, screen.y/2))
	elif rand == 1:
		bulletPos = Vector2(screen.x/2, randf_range(-screen.y/2, screen.y/2))
	elif rand == 2:
		bulletPos = Vector2(randf_range(-screen.x/2, screen.x/2), -screen.y/2)
	elif rand == 3:
		bulletPos = Vector2(randf_range(-screen.x/2, screen.x/2), screen.y/2)
		
	spawnBullet(bulletPos)
