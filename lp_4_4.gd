extends Control



func _on_button_pressed() -> void:
	var numv = $LineEdit.text 
	if numv == 119:
		$Label2.text = "Uh oh! Your car is broken!"
	elif numv == 179:
		$Label2.text = "Uh oh! Your car is broken!"
	elif numv > 188 or numv == 195:
		$Label2.text = "Uh oh! Your car is broken!"
	elif numv == 221:
		$Label2.text = "Uh oh! Your car is broken!"
	elif numv == 780:
		$Label2.text = "Uh oh! Your car is broken!"
	else: 
		$Label2.text = "Your car is ok!"
