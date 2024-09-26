extends Control

var num = 0
func payThing(): num *= 4

	
func _on_button_pressed() -> void:
	payThing()
	if num <= 0:
		$LineEdit.text = "FIRED"
