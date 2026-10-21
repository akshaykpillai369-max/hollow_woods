
extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -800.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var walk_sound: AudioStreamPlayer = $WalkSound
@onready var jump_sound: AudioStreamPlayer = $JumpSound
@onready var land_sound: AudioStreamPlayer = $LandSound
var was_on_floor: bool = true

func _physics_process(delta: float) -> void:
	# Apply gravity
	if not is_on_floor():
		velocity += get_gravity() * delta


	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()
		
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction != 0:
		velocity.x = direction * SPEED
		sprite.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0.0, SPEED)
		
	move_and_slide()
	if is_on_floor() and not was_on_floor:
		land_sound.play()
	was_on_floor = is_on_floor()
	if is_on_floor() and direction != 0:
		if not walk_sound.playing:
			walk_sound.play()
	else:
		walk_sound.stop()
		
	if not is_on_floor():
		if sprite.sprite_frames.has_animation("jump"):
			sprite.play("jump")
		elif sprite.sprite_frames.has_animation("walk"):
			sprite.play("walk")
	elif direction != 0:
		sprite.play("walk")
	else:
		sprite.play("idle")
		
func die():
	set_physics_process(false)
	velocity = Vector2.ZERO
	$DeathSound.play()
	get_tree().current_scene.get_node("UI/DeathScreen").show()
	
