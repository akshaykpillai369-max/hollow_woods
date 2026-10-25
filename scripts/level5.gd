extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LevelMusic.play()
	GameManager.has_key = false
	GameManager.current_level = 5

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
	get_tree().change_scene_to_file("res://scenes/coming_soon.tscn")


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var tween = create_tween()
		tween.tween_property(
			$HoveringGround5,
			"position:x",
			$HoveringGround5.position.x - 300,
			0.2
		)
		var support_tween = create_tween()
		support_tween.tween_property(
			$HoveringGround11,
			"position:x",
			$HoveringGround11.position.x + 300,
			0.2
		)
		var next_next_tween = create_tween()
		next_next_tween.tween_property(
			$HoveringGround12,
			"position:x",
			$HoveringGround12.position.x + 600,
			0.2
		)
		
		await get_tree().create_timer(2).timeout
		var next_tween = create_tween()
		next_tween.tween_property(
			$HoveringGround5,
			"position:x",
			$HoveringGround5.position.x + 300,
			0.2
		)
		$HoveringGround5/PlatformMoveTrigger.monitoring = false
		$HoveringGround5/PlatformMoveTrigger.monitorable = false
		
		
