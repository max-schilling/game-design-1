extends Control

func _on_calc_pressed() -> void:
	var eggs = int($LineEdit.text)
	var price = 0.0 # Price per dozen
	var tcost = 0.0 # Total coast
	if eggs > 0 and eggs <= 47:
		price = 0.50
	elif eggs > 47 and eggs <= 71:
		price = 0.45
	elif eggs > 71 and eggs <= 131:
		price = 0.40
	elif eggs > 132:
		price = 0.35
	else: 
		$lblout.text = "Invalid number of eggs"
		return
	tcost = price * eggs
	$lblout.text = "Price per dozen: $" + str(price) + \
				"\nTotal cost: $%.2f" % tcost


func _on_clear_pressed() -> void:
	$lblout.text = ""
	$LineEdit.text = ""


func _on_exit_pressed() -> void:
	get_tree().quit()
