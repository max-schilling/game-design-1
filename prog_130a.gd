extends Control



func _on_button_pressed() -> void:
	for num in range(0 , 51, 2):
		(num * 3) + 1
		var line = str(num)
		$ItemList.add_item(line)
	for num in range(1, 52, 2):
		(num / 2)
		var crocant = str(num)
		$ItemList.add_item(crocant)

func _on_button_2_pressed() -> void:
	$ItemList.text = ""


func _on_button_3_pressed() -> void:
	get_tree().quit()
