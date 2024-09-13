extends Control

func _on_calc_pressed() -> void:
	var eggs = int($LineEdit.text)
	var price = 0.0 # Price per dozen
	var tcost = 0.0 # Total coast
	if eggs > 0 and eggs <= 99:
		price = 0.30
	elif eggs > 99 and eggs <= 499:
		price = 0.28
	elif eggs > 499 and eggs <= 749:
		price = 0.27
	elif eggs > 749 and eggs <= 1000:
		price = 0.26
	elif eggs > 1000:
		price = 0.25
	else: 
		$lblout.text = "Invalid number of copies"
		return
	tcost = price * eggs
	$lblout.text = "Price per copy: $" + str(price) + \
				"\nTotal cost: $%.2f" % tcost


func _on_clear_pressed() -> void:
	$lblout.text = ""
	$LineEdit.text = ""


func _on_exit_pressed() -> void:
	get_tree().quit()
