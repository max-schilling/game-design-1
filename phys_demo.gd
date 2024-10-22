extends Node2D

var phys_ball = preload("res://phys_ball.tscn")
func _ready() -> void:
	$Panel/gravSlider.value = $phys_ball.gravity_scale

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		var nball = phys_ball.instantiate()
		nball.position = event.position
		nball.gravity_scale = float($Panel/gravSlider.value)
		nball.inertia = float($Panel/txt_Inertia.text)
		nball.linear_velocity = Vector2(float($Panel/txt_VelX.text), float($Panel/txt_VelY.text))
		add_child(nball)


func _on_grav_slider_value_changed(value: float) -> void:
	for child in get_children():
		if child is RigidBody2D:
			child.gravity_scale = value


func _on_button_pressed() -> void:
	for child in get_children():
		if child is RigidBody2D:
			var force = randi_range(50, 1000)
			child.apply_central_force(Vector2(1, 0) * force)




func _on_button_2_pressed() -> void:
	var v_inertia = float($Panel/txt_Inertia.text)
	var v_x = float($Panel/txt_VelX.text)
	var v_y = float($Panel/txt_VelY.text)
	var velocity = Vector2(v_x, v_y)
	for child in get_children():
		if child is RigidBody2D:
			child.inertia = v_inertia
			child.linear_velocity = velocity 
			
