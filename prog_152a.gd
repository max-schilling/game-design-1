extends Control


func _on_btncalc_pressed() -> void:
	var mySum = 0
	var lcv = 3 #Loop control variable
	while lcv <= 9669: #runs while true
		mySum += lcv
		$ItemList.add_item(str(mySum))
		lcv += 3
	# for lcv in range(3, 9670, 0)


func _on_btnclear_pressed() -> void:
	$ItemList.clear()


func _on_btnexit_pressed() -> void:
	get_tree().quit()
