extends Area2D

@onready var sound = $AudioStreamPlayer2D
@export var next_level = "plt_2_world_2" 


func _on_body_entered(area: Area2D) -> void:
	var body = $CollisionShape2D
	var groups = body.get_groups()
	for aGroup in groups:
		print(aGroup)
	
	#if body.is_in_group("player"):
	if body.name == "plt_2player":
		if next_level == "":
			OS.alert("You've run dry of levels")
		else:
			sound.play()
			var lvl = "res://gameParts/" + next_level + ".tscn"
			get_tree().change_scene_to_file(lvl)
