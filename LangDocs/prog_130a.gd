extends Control



func _on_button_pressed() -> void:
	var bum = $LineEdit.text
	$ItemList.add_item(bum)
	while bum in range(1, 52, 2):
		var boat = (bum * 3) + 1
		$ItemList.add_item(boat)
	while bum in range(0, 51, 2):
		var rum = bum / 2
		$ItemList.add_item(rum)
	if bum < 5:
		$ItemList.add_Item()
	else:
		$ItemList.add_item()
	
func _on_button_2_pressed() -> void:
	$ItemList.clear()


func _on_button_3_pressed() -> void:
	get_tree().quit()
