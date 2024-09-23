extends Control

func _on_btnshow_pressed() -> void:
	$Label.text = "Football / Jazz Band"

func _on_btnclear_pressed() -> void:
	$Label.text = ""

func _on_btnexit_pressed() -> void:
	get_tree().quit()
