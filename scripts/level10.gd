extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LevelMusic.play()
	GameManager.has_key = false
	GameManager.current_level = 8
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
	get_tree().change_scene_to_file("res://scenes/level9.tscn")

#func _on_platform_vanish_trigger_body_entered(body: Node2D) -> void:
	#if body == $Player:
		#$PlatformVanishTrigger.queue_free()
		#await get_tree().create_timer(1).timeout
		#$HoveringGround12.queue_free()
		#await get_tree().create_timer(1.1).timeout
		#$HoveringGround.queue_free()
		#await get_tree().create_timer(1.5).timeout
		#$HoveringGround8.queue_free()
	


func _on_platform_vanish_trigger_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$HoveringGround3.queue_free()
		$PlatformVanishTrigger2.queue_free()
		await get_tree().create_timer(1.2).timeout
		
		var tween = create_tween()
		
		tween.tween_property(
			$HoveringGround11,
			"position:x",
			$HoveringGround11.position.x + 370,
			1
		)
		tween.tween_property(
			$HoveringGround11,
			"position:y",
			$HoveringGround11.position.y - 170,
			1
		)
		await get_tree().create_timer(5).timeout
		$HoveringGround11.queue_free()
		await get_tree().create_timer(1.5).timeout
		$HoveringGround6.queue_free()
		await get_tree().create_timer(1.5).timeout
		$HoveringGround10.queue_free()
		await get_tree().create_timer(1.8).timeout
		$HoveringGround5.queue_free()
		await get_tree().create_timer(2).timeout
		$HoveringGround7.queue_free()
		
		

func _on_ground_vanish_trigger_body_entered(body: Node2D) -> void:
	$HoveringGround10.hide()
	$HoveringGround10/GroundVanishTrigger.monitorable = false
	$HoveringGround10/GroundVanishTrigger.monitoring = false
	await get_tree().create_timer(1.5).timeout
	$HoveringGround10.show()
	$HoveringGround10/GroundVanishTrigger.queue_free()
	
	
	
