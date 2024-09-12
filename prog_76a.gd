extends Control



func _on_button_pressed() -> void:
	var num = $LineEdit.text
	var num3 = $LineEdit2.text
	
	if num3 == 9:
		$Label2.text = "good"
		
	else: num3 > 9
	$Label2.text = "Uh oh"
		
	if num3 == 9:
		$Label2.text = "good" 
	else: num3 < 9
	$Label2.text = "uh oh"
	
	var num2 = num * num3
	var yea = num2 * 12345679
	
	$Label2.text = " " + str(yea)
	

func _on_btn_exit_pressed() -> void:
	get_tree().quit()
