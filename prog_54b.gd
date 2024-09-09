extends Control

func _on_btn_calc_pressed() -> void:
	var numa = int($txtNumImp_1.text)
	var numb = int($txtNumImp_2.text)
	var numc = int($txtNumImp_3.text)
	var numd = int($txtNumImp_4.text)
	var numSum = numa + numb + numc + numd
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
