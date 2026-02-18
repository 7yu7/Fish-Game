extends Area2D

var bullet_direction
const SPEED = 200
const HOMING = true

func _ready() -> void:
	bullet_direction =  Vector2(1,1).normalized()

func _process(delta: float) -> void:
	if HOMING: bullet_direction =  ($"../Player".position - position).normalized()
	position += bullet_direction * SPEED * delta
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		print("DAMAGE!!")
		body.health -= 1
		print(body.health)
		queue_free()
	elif body.name == "Hand":
		queue_free()
