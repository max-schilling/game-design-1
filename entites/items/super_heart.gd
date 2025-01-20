extends BaseItem

func _init(): super._init(10)

func _process(delta: float) -> void:
	flicker_state = false
	var player = $td_player
	if interact(player).is_interacted_with():
		remove()
func interact(player):
	player.pickup_health(value)
	remove()
