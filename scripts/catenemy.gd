extends CharacterBody2D

@export var speed: float = 150.0
@export var go_distance: float = 150.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var caught_player: bool = false
var start_x: float
var direction: float = 1.0

func _ready() -> void:
	start_x = global_position.x

func _physics_process(_delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * _delta
		
	if abs(global_position.x - start_x) >= go_distance:
		direction *= -1.0
		start_x = global_position.x

	velocity.x = direction * speed
	sprite.flip_h = direction < 0
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider() == get_parent().get_node_or_null("Player"):
			trigger_kill()
			return
func trigger_kill() -> void:
	if caught_player:
		return

	caught_player = true
	velocity = Vector2.ZERO
	set_physics_process(false)

	var player = get_parent().get_node_or_null("Player")
	if not is_instance_valid(player):
		return

	player.set_physics_process(false)
	sprite.play("kill")
	$KillSound.play()
	

	var player_sprite = player.get_node_or_null("AnimatedSprite2D")
	if is_instance_valid(player_sprite):
		player_sprite.hide()
		await get_tree().create_timer(0.3).timeout
		$VanishSound.play()

	get_tree().current_scene.get_node("UI/DeathScreen").show()
