extends CanvasLayer

@onready var button_resume = $VBoxContainer/ButtonResume

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _unhandled_input(event):
	if event.is_action_pressed("pause_mode"):
		visible = true
		get_tree().paused = true
		button_resume.grab_focus()

func _on_button_resume_pressed():
	visible = false
	get_tree().paused = false

func _on_button_quit_game_pressed():
	get_tree().quit()
