extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$LevelMusic.play()


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
