extends Node

var cartasDesbloqueadas: int = 1

var player: CharacterBody2D
var sucessful : bool
var holding : bool
var numberCards = 0
var playerLoving = 0
var launched : bool

func _ready():
	pass
		

	
func _process(delta):
	if playerLoving == 2:
		get_tree().change_scene_to_file("res://scenes/vitoria.tscn")
	
	# DEBUG: Atalho para reiniciar cena
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().reload_current_scene();
