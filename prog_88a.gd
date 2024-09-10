extends Control



func _on_btn_calc_pressed() -> void:
	var num1 = int($LineEdit.text)
	var num2 = int($LineEdit2.text)
	var Sum = num1 + num2
	var Diff = num1 - num2
	var Prod = num1 * num2
	var Aver
	var Abs = abs(Diff)
	var Max = 0
	var Min = 0
	if num1 > num2:
		Max = num1
		#Min = num2
	else: 
		Max = num2
		
	if Max == num1: #Check if same value
		Min = num2
	else:
		Min = num1
	
	$bigLabel.text = "Sum: " + str(Sum) + \
				"\nDifferance: " + str(Diff) + \
				
				"\nAbs. Differance: " + str(Abs) + \
				"\nMax: " + str(Max) + \
				"\nMin: " + str(Min)

func _on_btn_clear_pressed() -> void:
	#do regular clear thingys


func _on_btn_exit_pressed() -> void:
	get_tree().quit()
