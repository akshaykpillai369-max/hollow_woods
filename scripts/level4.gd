extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LevelMusic.play()
	GameManager.has_key = false
	GameManager.current_level = 3

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
	if body == $Player:
		$Enemy2.show()
		$Enemy2/CollisionShape2D.set_deferred("disabled", false)
		$Enemy2.set_physics_process(true)
		$Enemy2/EnemyTrigger.queue_free()


func _on_wrong_door_trigger_body_entered(body: Node2D) -> void:
	if body == $Player:
		$UI/WrongDoorLabel.show()
		await get_tree().create_timer(2).timeout
		$UI/WrongDoorLabel.hide()
		


func _on_crt_door_show_trigger_body_entered(body: Node2D) -> void:
	$Door2.show()
