extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LevelMusic.play()
	GameManager.has_key = false
	GameManager.current_level = 10
	var horizontal_tween = create_tween().set_loops()
	horizontal_tween.tween_property(
		$HoveringGround13,
		"position:x",
		$HoveringGround13.position.x + 700,
		2.5
	)
	horizontal_tween.tween_property(
		$HoveringGround13,
		"position:x",
		$HoveringGround13.position.x,
		3
	)
	
	
func _on_monster_trigger_body_entered(body: Node2D) -> void:
	if body == $Player:
		$Enemy.show()
		$Enemy/CollisionShape2D.set_deferred("disabled", false)
		$Enemy.set_physics_process(true)
		$MonsterTrigger.queue_free()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func _on_next_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level11.tscn")

func _on_ground_vanish_trigger_body_entered(body: Node2D) -> void:
	$HoveringGround10.hide()
	$HoveringGround10/GroundVanishTrigger.monitorable = false
	$HoveringGround10/GroundVanishTrigger.monitoring = false
	await get_tree().create_timer(1.5).timeout
	$HoveringGround10/GroundVanishTrigger.queue_free()
	$HoveringGround10.show()
	
	
	
	
