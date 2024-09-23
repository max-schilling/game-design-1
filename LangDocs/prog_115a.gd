extends Control


func _on_btncalc_pressed() -> void:
	$ItemList.add_item("Number")
	
	# range(stop)
	# range(start, stop)
	# range(start, stop, step)
	# the stop number is excluded, so add 1 if nedded
	
	for num in range(2, 36+1, 2):
		var line = str(num)
		$ItemList.add_item(line)


func _on_btnclear_pressed() -> void:
	$ItemList.clear()


func _on_btnexit_pressed() -> void:
	get_tree().quit()
