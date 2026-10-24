
extends Area2D

var player_nearby: bool = false
var is_open: bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_nearby = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_nearby = false

func _process(_delta: float) -> void:
	if player_nearby and Input.is_action_just_pressed("interact"):
		if GameManager.has_key:
			if not is_open:
				$AnimatedSprite2D.play("openclose")
				is_open = true
				get_parent().get_node_or_null("UI/WinnerScreen").show()
				get_parent().set_physics_process(false)
				GameManager.reached_door = true
				if GameManager.current_level < Settings.highest_unlocked_level:
					pass
				elif GameManager.current_level == Settings.highest_unlocked_level:
					
					Settings.highest_unlocked_level = GameManager.current_level + 1
					Settings.save_progress()
				
		else:
			get_parent().get_node_or_null("UI/DoorLockedLabel").show()
			await get_tree().create_timer(2).timeout
			get_parent().get_node_or_null("UI/DoorLockedLabel").hide()
			
