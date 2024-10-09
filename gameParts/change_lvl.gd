extends Area2D


@export var next_level = ""

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if next_level == "":
			OS.alert("You've run dry of levels")
		else:
			var lvl = "res://" + next_level + ".tscn"
			get_tree().change_scene_to_file(lvl)