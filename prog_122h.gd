extends Control




func _on_button_pressed() -> void:
	for num in range(1, 21):
		var n2 = num ** 2
		var n3 = str(num ** float(1) / float(2))
		var n4 = num ** 3
		var n5 = str(num ** float(1) / float(4))
		$ItemList.add_item(str(num))
		$ItemList.add_item(str(n2))
		$ItemList.add_item(str(n3))
		$ItemList.add_item(str(n4))
		$ItemList.add_item(str(n5))


func _on_button_2_pressed() -> void:
	$ItemList.clear()


func _on_button_3_pressed() -> void:
	get_tree().quit()
