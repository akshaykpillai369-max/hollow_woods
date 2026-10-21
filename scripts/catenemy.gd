extends CharacterBody2D

@export var speed: float = 100.0
@export var patrol_distance: float = 150.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var start_x: float
var direction: float = 1.0

func _ready() -> void:
	start_x = global_position.x

func _physics_process(_delta: float) -> void:
	if abs(global_position.x - start_x) >= patrol_distance:
		direction *= -1.0
		start_x = global_position.x

	velocity.x = direction * speed
	sprite.flip_h = direction < 0
	move_and_slide()
