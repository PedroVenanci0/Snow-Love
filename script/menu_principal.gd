extends Control

@onready var cora__o_gelado_2 = $"CoraçãoGelado2"

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cora__o_gelado_2

func _on_quit_gmae_pressed():
	get_tree().quit()

func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")

func _on_cartas_desbloqueadas_pressed():
	get_tree().change_scene_to_file("res://scenes/Mostrando_cartas.tscn")

