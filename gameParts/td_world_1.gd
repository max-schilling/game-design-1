extends Node2D

@export var p_data = {
	"max_health": 60.0,
	"health": 50.0,
	"money": 0,
	"secondaries": []
}

func _process(delta: float) -> void:
	if p_data.health == 0.0:
		$AudioStreamPlayer.stop()
