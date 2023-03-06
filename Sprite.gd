extends Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func process_keyboard(key_label):
	var step = 20
	match(key_label):
		KEY_UP:
			position += Vector2.UP * step
		KEY_DOWN:
			position += Vector2.DOWN * step
		KEY_RIGHT:
			position += Vector2.RIGHT * step
		KEY_LEFT:
			position += Vector2.LEFT * step

func process_mouse(button_index):
	if button_index == MOUSE_BUTTON_LEFT:
		var is_vertically_flipped = self.flip_v
		self.set_flip_v(!is_vertically_flipped)
	elif button_index == MOUSE_BUTTON_RIGHT:
		var is_horizontally_flipped = self.flip_h
		self.set_flip_h(!is_horizontally_flipped)

func _input(event):
	if event is InputEventKey and event.pressed:
		process_keyboard(event.key_label)
	if event is InputEventMouseButton and event.pressed and get_rect().has_point(to_local(event.position)):
		process_mouse(event.button_index)
