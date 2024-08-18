extends Control

@onready var go_over_label = $GoOverLabel
@onready var space_label = $SpaceLabel 
@onready var timer = $Timer
@onready var game_over_sound = $GameOverSound


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	SignalManager.on_bird_died.connect(on_bird_died)
	ScoreManager.set_score(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if space_label.visible == true:
		if Input.is_action_just_pressed("fly") == true:
			GameManager.load_main_scene()


func on_bird_died() -> void:
	show()
	timer.start()
	game_over_sound.play()

func _on_timer_timeout() -> void:
	go_over_label.hide()
	space_label.show()
