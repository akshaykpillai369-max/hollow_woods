
extends Sprite2D

@export var copies_each_side: int = 3

func _ready() -> void:
	var texture_width := texture.get_width() * absf(scale.x)

	for i in range(1, copies_each_side + 1):
		var left_copy := Sprite2D.new()
		left_copy.texture = texture
		left_copy.centered = centered
		left_copy.position = Vector2(-texture_width * i, 0)
		left_copy.scale = scale
		left_copy.z_index = z_index
		add_sibling(left_copy)

		var right_copy := Sprite2D.new()
		right_copy.texture = texture
		right_copy.centered = centered
		right_copy.position = Vector2(texture_width * i, 0)
		right_copy.scale = scale
		right_copy.z_index = z_index
		add_sibling(right_copy)
