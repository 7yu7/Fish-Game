extends CharacterBody2D


const SPEED = 700.0
const ACCEL = 800.0
const DECCEL = 80.0
const DASH = 1000
const TOP_HEALTH = 5
var health

func _ready() -> void:
	health = TOP_HEALTH



func _physics_process(delta: float) -> void:
	
	var direction := Input.get_vector("Left", "Right", "Up", "Down")
	
	if Input.is_action_just_pressed("Dash"):
		if direction.x * velocity.x < 0: velocity.x = 0;
		if direction.y * velocity.y < 0: velocity.y = 0;
		velocity += DASH * direction
	
	if direction:
		velocity += direction * ACCEL * delta
	else:
		velocity.x = move_toward(velocity.x, 0, DECCEL * delta)
		velocity.y = move_toward(velocity.y, 0, DECCEL * delta)
		
	if direction.x > 0: $Sprite2D.flip_h = true
	elif direction.x < 0: $Sprite2D.flip_h = false
	
	var screen = get_viewport_rect().size
	if abs(global_position.x) + 50 >= screen.x/2 or abs(global_position.y) + 50 >= screen.y/2:
		velocity = -global_position * 0.2
		
		
	move_and_slide()
	
	var mouse_pos = get_global_mouse_position()
	var angle =  (mouse_pos - global_position).angle()
	$Hand.rotation = angle
	
	$Hand/CollisionShape2D.disabled = !Input.is_action_pressed("Shoot")
		
	
	if health == 0:
		print("DIE")
		queue_free()
	
	
