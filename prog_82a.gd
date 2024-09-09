extends Control

func _on_button_2_pressed() -> void:
	$lblmoney.text = "$"
	$lblfine.text = "Fine: "
	$txtlimit.text = ""
	$txtspeed.text = ""
func _on_button_3_pressed() -> void:
	get_tree().quit()


func _on_btncalc_pressed() -> void:
	var speedLimit = int($txtlimit.text)
	var carSpeed = int($txtspeed.text)
	var milesOver = carSpeed - speedLimit
	var fine = 20.0 + (milesOver * 5.0) 
	$lblmoney.text = "$ %.2f" % fine
