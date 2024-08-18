extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.on_bird_died.connect(on_bird_died)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scroll_offset.x -= delta * GameManager.SCROLL_SPEED

func on_bird_died():
	set_process(false)
