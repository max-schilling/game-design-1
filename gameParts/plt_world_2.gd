extends Node2D



func _on_rigid_body_2d_body_entered(body: Node2D) -> void:
	if body.name == "plt_player":
		body.queue_free()
		OS.alert("You died")
		get_tree().reload_current_scene()
