extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LevelMusic.play()
	GameManager.has_key = false
	GameManager.current_level = 9
	hide_all_spikes()
	
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

func hide_all_spikes() -> void:
	for spike in get_tree().get_nodes_in_group("spikes"):
		spike.hide()
		spike.set_deferred("monitoring", false)
		spike.set_deferred("monitorable", false)

		var collision = spike.get_node_or_null("CollisionShape2D")
		if collision:
			collision.set_deferred("disabled", true)
		
func activate_spike(spike: Area2D) -> void:
	spike.show()
	spike.set_deferred("monitoring", true)
	spike.set_deferred("monitorable", true)

	var collision = spike.get_node_or_null("CollisionShape2D")
	if collision:
		collision.set_deferred("disabled", false)		

func _on_spike_show_trigger_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		activate_spike($Spike)
		await get_tree().create_timer(0.3).timeout
		activate_spike($Spike1)
		await get_tree().create_timer(0.3).timeout
		activate_spike($Spike2)
		await get_tree().create_timer(0.3).timeout
		activate_spike($Spike3)
		await get_tree().create_timer(0.3).timeout
		activate_spike($Spike4)
		await get_tree().create_timer(0.3).timeout
		activate_spike($Spike5)
		await get_tree().create_timer(0.3).timeout
		activate_spike($Spike6)
		await get_tree().create_timer(0.3).timeout
		activate_spike($Spike7)
		await get_tree().create_timer(0.3).timeout
		activate_spike($Spike8)
		await get_tree().create_timer(0.3).timeout
		activate_spike($Spike9)
		await get_tree().create_timer(0.3).timeout
		activate_spike($Spike10)
		await get_tree().create_timer(0.3).timeout
		activate_spike($Spike11)
		await get_tree().create_timer(0.5).timeout
		activate_spike($Spike12)
		await get_tree().create_timer(0.5).timeout
		activate_spike($Spike13)
		await get_tree().create_timer(0.5).timeout
		activate_spike($Spike14)
		await get_tree().create_timer(0.1).timeout
		activate_spike($Spike15)
		await get_tree().create_timer(0.1).timeout
		activate_spike($Spike16)
		await get_tree().create_timer(0.1).timeout
		activate_spike($Spike17)
		await get_tree().create_timer(0.4).timeout
		activate_spike($Spike18)
		await get_tree().create_timer(0.3).timeout
		activate_spike($Spike19)
		await get_tree().create_timer(0.3).timeout
		activate_spike($Spike20)
		await get_tree().create_timer(0.35).timeout
		activate_spike($Spike21)
		await get_tree().create_timer(0.45).timeout
		activate_spike($Spike22)
		await get_tree().create_timer(0.5).timeout
		activate_spike($Spike23)
		await get_tree().create_timer(0.5).timeout
		activate_spike($Spike24)
		await get_tree().create_timer(0.5).timeout
		activate_spike($Spike25)
		await get_tree().create_timer(0.2).timeout
		activate_spike($Spike26)
		await get_tree().create_timer(0.2).timeout
		activate_spike($Spike27)
		await get_tree().create_timer(0.2).timeout
		activate_spike($Spike28)
