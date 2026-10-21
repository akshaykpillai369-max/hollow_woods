extends CharacterBody2D

const SPEED = 225.0
@export var enemy_current_speed = SPEED
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
var player: CharacterBody2D
var caught_player: bool = false

func _ready() -> void:
	hide()
	animated_sprite.play("idle")
	player = get_parent().get_node_or_null("Player") as CharacterBody2D
	set_physics_process(false)
	$CollisionShape2D.set_deferred("disabled", true)
func _physics_process(_delta: float) -> void:
	if not is_instance_valid(player) or caught_player:
		return
	var direction := signf(player.global_position.x - global_position.x)
	velocity.x = direction * enemy_current_speed
	move_and_slide()
	for i in get_slide_collision_count():
		var collision := get_slide_collision(i)
		if collision.get_collider() == player:
			trigger_kill()
			return
func trigger_kill() -> void:
	if caught_player:
		return
	caught_player = true
	velocity = Vector2.ZERO
	set_physics_process(false)
	animated_sprite.play("kill")
	player.set_physics_process(false)
	if is_instance_valid(player):
		$KillSound.play()
	var player_collision: CollisionShape2D = \
		player.get_node_or_null("CollisionShape2D")
	if is_instance_valid(player_collision):
		player_collision.set_deferred("disabled", true)
	var player_sprite: AnimatedSprite2D = \
		player.get_node_or_null("AnimatedSprite2D")
	if not is_instance_valid(player_sprite):
		return
	var target_position := player.to_local(
	animated_sprite.global_position
)
	var death_tween := create_tween()
	death_tween.tween_property(
		player_sprite,
		"position",
		target_position,
		0.5
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	death_tween.tween_property(
		player_sprite,
		"scale",
		Vector2.ZERO,
		0.4
	).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_IN)
	death_tween.tween_callback(func():
		if is_instance_valid(player):
			player.hide()
			$VanishSound.play()
			get_tree().current_scene.get_node("UI/DeathScreen").show()
			
	)
