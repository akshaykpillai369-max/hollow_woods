extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Settings.guide_message_shown == false:
		pass
	else:
		$UI/PlayGuide.visible = false
	
	$LevelMusic.play()
	GameManager.reached_door = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_monster_trigger_body_entered(body: Node2D) -> void:
	if body == $Player:
		$Enemy.show()
		$Enemy/CollisionShape2D.set_deferred("disabled", false)
		$Enemy.set_physics_process(true)
		$MonsterTrigger.queue_free()


func _on_spike_effect_trigger_body_entered(body: Node2D) -> void:
	$SpikeEffectTrigger.set_deferred("monitoring", false)
	$SpikeEffectTrigger.set_deferred("monitorable", false)


func _on_hover_ground_show_trigger_body_entered(body: Node2D) -> void:
	if body == $Player:
		$HoveringGround2/CollisionShape2D.set_deferred("disabled", false)


func _on_next_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level2.tscn")


func _on_yes_buuton_pressed() -> void:
	$UI/PlayGuide.hide()
	Settings.guide_message_shown = true


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
