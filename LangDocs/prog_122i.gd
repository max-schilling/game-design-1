extends Control



func _on_button_pressed() -> void:
	for num in range(-25, 26):
		var seven = str(num ** 3)
		
		var eight = str(num ** float(1)/float(3)) 
		$ItemList.add_item(seven)
		$ItemList.add_item(eight)
		


func _on_button_2_pressed() -> void:
	$ItemList.clear()


func _on_button_3_pressed() -> void:
	get_tree().quit()
