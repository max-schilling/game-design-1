extends BaseItem

func _init(): super._init(5)

func interact(player):
	player.extend_health(value * 2)
	remove()
