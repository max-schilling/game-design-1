extends Control



func _on_button_pressed() -> void:
	var bum = int($LineEdit.text)
	var um = str(bum)
	$ItemList.add_item(um)
	while um in range(5, 52, 2):
		var boat = (bum * 3) + 1
		$ItemList.add_item(boat)
		$ItemList.text = "" + boat
	while um in range(0, 51, 2):
		var rum = str(bum / 2)
		$ItemList.add_item(rum)
		$ItemList.text = "" + rum
	
func _on_button_2_pressed() -> void:
	$ItemList.clear()


func _on_button_3_pressed() -> void:
	get_tree().quit()
