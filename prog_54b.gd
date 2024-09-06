extends Control

func _on_btn_calc_pressed() -> void:
	var num1 = int($txtNumImp1.text)
	var num2 = int($txtNumImp2.text)
	var num3 = int($txtNumImp3.text)
	var num4 = int($txtNumImp4.text)
	var numSum = num1 + num2 + num3 + num4
	var numAver = numSum / 4
	$lblAver.text = "Average: " + str(numAver)
	$lblSum.text = "Sum: " + str(numSum)
# Operators: + - * / %          ** pow
# str - string (text)
#int - interger (whole number)
#float - floating-point number (w/ decimal)

func _on_btn_clear_pressed() -> void:
	$txtLen.text = ""
	$txtWid.text = ""
	$lblAver.text = "Average: "
	$lblSum.text = "Sum: "

func _on_btn_exit_pressed() -> void:
	get_tree().quit()
