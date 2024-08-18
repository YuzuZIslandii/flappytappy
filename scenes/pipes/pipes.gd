extends Node2D

@onready var score_sound = $ScoreSound

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_bird_died.connect(on_bird_died)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= delta * GameManager.SCROLL_SPEED

func on_bird_died() -> void:
	set_process(false)

func _on_screen_exited():
	queue_free()


func _on_laser_body_exited(body):
	if body.is_in_group(GameManager.GROUP_PLAYER) == true:
		ScoreManager.increment_score()
		score_sound.play()


func _on_pipe_body_entered(body):
	if body.is_in_group(GameManager.GROUP_PLAYER) == true:
		if body.has_method("die") == true:
			body.die()
