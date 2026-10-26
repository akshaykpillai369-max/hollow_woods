extends Node2D

var triggered := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LevelMusic.play()
	GameManager.has_key = false
	GameManager.current_level = 11


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_monster_trigger_body_entered(body: Node2D) -> void:
	if body == $Player:
		$Enemy.show()
		$Enemy/CollisionShape2D.set_deferred("disabled", false)
		$Enemy.set_physics_process(true)
		$MonsterTrigger.queue_free()	

func _on_next_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/coming_soon.tscn")

func _on_ground_rotate_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$HoveringGround2/CollisionShape2D.set_deferred("disabled", true)
		$HoveringGround2.rotation_degrees = 90.0
		$HoveringGround3/CollisionShape2D.set_deferred("disabled", true)
		$HoveringGround3.rotation_degrees = 90.0
		$HoveringGround2/GroundRotate.queue_free()
		


func _on_ground_rotate_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$HoveringGround5.rotation_degrees = 90.0


func _on_ground_move_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$HoveringGround2/CollisionShape2D.set_deferred("disabled", true)
		$HoveringGround3/CollisionShape2D.set_deferred("disabled", true)
		$HoveringGround2.hide()
		$HoveringGround3.hide()
		$HoveringGround4/GroundMove.queue_free()
		var tween = create_tween()
		tween.tween_property(
			$HoveringGround4,
			"position:x",
			$HoveringGround4.position.x + 400,
			2.5
		)
		tween.tween_property(
			$HoveringGround4,
			"position:y",
			$HoveringGround4.position.y - 300,
			3
		)


func _on_ground_move_2_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$HoveringGround5/CollisionShape2D.set_deferred("disabled", true)
		$HoveringGround3/CollisionShape2D.set_deferred("disabled", true)
		await get_tree().create_timer(0.5).timeout
		var next_tween = create_tween()
		next_tween.tween_property(
			$HoveringGround7,
			"position:x",
			$HoveringGround7.position.x - 2500,
			2.5
		)
		$HoveringGround7/GroundMove2.queue_free()
		
		
