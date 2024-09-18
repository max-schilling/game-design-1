extends Control



func _on_btncalc_pressed() -> void:
	$ItemList.add_item("Number        Square      Square Root")
	for num in range(1, 51):
		var numsquared = num**2 # pow(num, 2)
		var numsqurt = sqrt(num)
		var line = "%d    %d    %.4f" % [num, numsquared, numsqurt]
		$ItemList.add_item(line)


func _on_btnclear_pressed() -> void:
	$ItemList.clear()


func _on_btnexit_pressed() -> void:
	get_tree().quit()
