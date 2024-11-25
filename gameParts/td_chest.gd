extends Node2D

@export var next_level = "td_world_2" 

var drops = ["drop_coin", "drop_heart"]
@onready var audplay = $AudioStreamPlayer2D
var coin_scene = preload("res://entites/items/mini_coin.tscn")
var heart_scene = preload("res://entites/items/mini_mart.tscn")
var damage_shader = preload("res://assets/shaders/take_damage.tres")
func drop_items():
	var num_drops = randi() % 3 + 1
	for i in range(num_drops):
		var rnd_drop = drops[randi() % drops.size()]
		call_deferred(rnd_drop)

func _on_body_entered(body: Node2D) -> void:
	var groups = body.get_groups()
	for aGroup in groups:
		print(aGroup)
	
	if body.name == "td_player":
		drop_items()
		audplay.play()
		
