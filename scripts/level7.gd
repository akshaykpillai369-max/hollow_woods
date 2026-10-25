extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LevelMusic.play()
	GameManager.has_key = false
	GameManager.current_level = 7
	$CatEnemy.hide()
	$HoveringGround11.hide()
	var horizontal_tween = create_tween().set_loops()
	horizontal_tween.tween_property(
		$HoveringGround8,
		"position:x",
		$HoveringGround8.position.x + 600,
		3
	)
	
	horizontal_tween.tween_property(
		$HoveringGround8,
		"position:x",
		$HoveringGround8.position.x ,
		3
	)
	
	var vertical_tween = create_tween().set_loops()
	vertical_tween.tween_property(
		$HoveringGround3,
		"position:y",
		$HoveringGround8.position.y - 600,
		3
	)
	vertical_tween.tween_property(
		$HoveringGround3,
		"position:y",
		$HoveringGround8.position.y,
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
	get_tree().change_scene_to_file("res://scenes/coming_soon.tscn")

func _on_ground_hide_trigger_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var tween = create_tween()
		tween.tween_property(
			$HoveringGround2,
			"position:x",
			$HoveringGround2.position.x + 300,
			0.2
		)
		var next_tween = create_tween()
		next_tween.tween_property(
			$HoveringGround12,
			"position:y",
			$HoveringGround12.position.y - 200,
			0.2
		)

func _on_cat_down_trigger_body_entered(body: Node2D) -> void:
	if body == $Player:
		$HoveringGround11.queue_free()
		$CatEnemy.show()
		await get_tree().create_timer(3).timeout
		$CatEnemy.queue_free()
		$CatDownTrigger.queue_free()
