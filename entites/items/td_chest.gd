extends BaseItem

func update():
	flicker_start_time == 3.0
	time_to_despawn == 6.0

func _init(): super._init(5)

func interact(player):
	player.pickup_money(value * 2)
	player.pickup_health(value * 2)
