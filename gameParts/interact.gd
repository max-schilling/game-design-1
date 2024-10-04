extends RigidBody2D



func _on_body_entered(body: Node) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		self.queue_free() #Deletes self
