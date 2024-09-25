extends Control



func _on_button_pressed() -> void:
	var bum = int($LineEdit.text)
	var um = str(bum)
	while um in range(1, 502, 2):
		var boat = (bum * 3) + 1
		$ItemList.add_item(boat)
		$ItemList.text = "" + boat
	while um in range(0, 501, 2):
		var rum = str(bum / 2)
		$ItemList.add_item(rum)
	
func _on_button_2_pressed() -> void:
	$ItemList.clear()


func _on_button_3_pressed() -> void:
	get_tree().quit()
