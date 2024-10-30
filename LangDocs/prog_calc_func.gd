extends Control


func myAdd(num1, num2):
	int(num1 + num2)
func mySub(num1, num2):
	int(num1 - num2)
func myMul(num1, num2):
	int(num1 * num2)
func myDiv(num1, num2):
	int(num1 / num2)
func myPow(num1, num2):
	int(num1 ** num2)
func myMod(num1, num2):
	int(num1 % num2)



func _on_add_button_pressed() -> void:
	var n1 = int($txtNum1.text)
	var n2 = int($txtNum2.text)
	var result = myAdd(n1, n2)
	$lblout.text = str(result)


func _on_mod_button_pressed() -> void:
	var n1 = int($txtNum1.text)
	var n2 = int($txtNum2.text)
	var result = myMod(n1, n2)
	$lblout.text = str(result)


func _on_pow_button_pressed() -> void:
	var n1 = int($txtNum1.text)
	var n2 = int($txtNum2.text)
	var result = myPow(n1, n2)
	$lblout.text = str(result)


func _on_exit_button_pressed() -> void:
	get_tree().quit()


func _on_clear_button_pressed() -> void:
	$lblout.text = ""
	$txtNum1.text = ""
	$txtNum2.text = ""


func _on_div_button_pressed() -> void:
	var n1 = int($txtNum1.text)
	var n2 = int($txtNum2.text)
	var result = myDiv(n1, n2)
	$lblout.text = str(result)


func _on_mult_button_pressed() -> void:
	var n1 = int($txtNum1.text)
	var n2 = int($txtNum2.text)
	var result = myMul(n1, n2)
	$lblout.text = str(result)


func _on_sub_button_pressed() -> void:
	var n1 = int($txtNum1.text)
	var n2 = int($txtNum2.text)
	var result = mySub(n1, n2)
	$lblout.text = str(result)
