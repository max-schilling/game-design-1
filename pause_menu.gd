extends Control



func _ready() -> void:
	self.process_mode = Node.PROCESS_MODE_ALWAYS


func _on_resume_btn_pressed() -> void:
	self.hide()
	get_tree().pause = false


func _on_quit_btn_pressed() -> void:
	get_tree().quit()
