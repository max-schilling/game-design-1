extends Control

func _on_btnshow_pressed() -> void:
	$Label.text = "Max Schilling"

func _on_btnhide_pressed() -> void:
	$Label.text = ""

func _on_btnexit_pressed() -> void:
	get_tree().quit()
