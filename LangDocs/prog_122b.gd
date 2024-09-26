extends Control


func happyYes(mar):
	var num = $LineEdit.text
	var yum = mar * 4
	return num
	
func _on_button_pressed() -> void:
	var m = int($LineEdit.text)
	var pay = happyYes(m)
	$lblout.text = "Your pay is: " + pay
