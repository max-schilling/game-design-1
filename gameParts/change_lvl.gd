extends Area2D


@export var next_level = "plt_world_3" 



func _on_body_entered(body: Node2D) -> void:
	var groups = body.get_groups()
	for aGroup in groups:
		print(aGroup)
	
	#if body.is_in_group("player"):
	if body.name == "plt_player":
		if next_level == "":
			OS.alert("You've run dry of levels")
		else:
			var lvl = "res://gameParts/" + next_level + ".tscn"
			get_tree().change_scene_to_file(lvl)
