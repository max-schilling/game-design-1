extends Control



func _on_button_pressed() -> void:
	var fun = $LineEdit.text
	var more = fun * 9
	var yea = more * 12345679
	$Label2.text = "boo " + str(yea)
