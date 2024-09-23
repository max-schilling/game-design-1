extends Control



func _on_calc_pressed() -> void:
	var copies = int($LineEdit.text)
	var price = 0.0 # Price per copy
	var tcost = 0.0 # Total coast
	if copies > 0 and copies <= 99:
		price = 0.30
	elif copies > 99 and copies <= 499:
		price = 0.28
	elif copies > 499 and copies <= 749:
		price = 0.27
	elif copies > 749 and copies <= 1000:
		price = 0.26
	elif copies > 1000:
		price = 0.25
	else: 
		$lblout.text = "Invalid number of copies"
		return
	tcost = price * copies
	$lblout.text = "Price per copy: $" + str(price) + \
				"\nTotal cost: $%.2f" % tcost


func _on_clear_pressed() -> void:
	$lblout.text = ""
	$LineEdit.text = ""


func _on_exit_pressed() -> void:
	get_tree().quit()
