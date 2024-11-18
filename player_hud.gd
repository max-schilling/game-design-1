extends CanvasLayer

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var hearts = $playerHealth/hearts

const HEART_ROW_SIZE = 10
const HEART_OFFSET = 16

func create_heart():
	var new_heart = Sprite2D.new()
	new_heart.texture = hearts.texture
	new_heart.hframes = hearts.hframes
	new_heart.vframes = hearts.vframes
	new_heart.frame = 8
	hearts.add_child(new_heart)

func draw_hearts():
	for hearts in hearts.get_children():
		hearts.remove_children(hearts)
	for i in range(int(player.data.max_health) / 20):
		create_heart()

func _ready() -> void:
	draw_hearts()

func _process(delta: float) -> void:
	$money/Label.text = "%03d" % player.data.money
	var p_health = player.data.health
	var full_hearts = floor(p_health / 20)
	var remain = int(p_health) % 20
	for heart in hearts.get_children():
		var index = heart.get_index()
		var x = (index % HEART_ROW_SIZE) * HEART_OFFSET
		var y = (index / HEART_ROW_SIZE) * HEART_OFFSET
		heart.position = Vector2(x, y)
		
		if index > full_hearts:
			heart.frame = 8
		elif index == full_hearts:
			heart.frame = 8 - int(remain / 5)
		elif index < full_hearts:
			heart.frame = 4
	pass
