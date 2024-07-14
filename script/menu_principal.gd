extends Control

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_quit_gmae_pressed():
	get_tree().quit()

func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://scenes/Tutorial.tscn")
	Global.playerLoving = 0

func _on_cartas_desbloqueadas_pressed():
	get_tree().change_scene_to_file("res://scenes/Mostrando_cartas.tscn")

