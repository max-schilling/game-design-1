extends Control

var score = 0
func addPoint(): score += 1
func subPoint(): score -= 1
func reset():    score = 0
func update():
	$lblout.text = "Score: %d" % score
func _on_btn_update_pressed() -> void:
	var choice = $LineEdit.text.to_lower()
	if choice == "add":
		addPoint()
	elif choice == "sub" or choice == "subtract":
		subPoint()
	else:
		OS.alert("Invalid choice") # capital O and S for that funny error box
	update()
	


func _on_btn_reset_pressed() -> void:
	reset()
	update()
