extends Control



func _on_btn_1_pressed() -> void:
	$Label.text = ""

func _on_btn_2_pressed() -> void:
	$Label.text = ""

func _on_btn_work_pressed() -> void:
	$Label.text = "Hooray"

func _on_btn_4_pressed() -> void:
	$Label.text = ""

func _on_btn5_pressed() -> void:
	get_tree().quit()
