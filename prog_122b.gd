extends Control

var num = 1
var bum = num * 4
func payThing():
	int(num + bum) * 4


	
func _on_button_pressed() -> void:
	var choice = int($LineEdit.text)
	var car = choice + int(payThing())
	$lblout.text = " Your pay is:" + car
	if car <= 1:
		$lblout.text = "FIRED"
