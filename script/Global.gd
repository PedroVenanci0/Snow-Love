extends Node

var cartasDesbloqueadas: int = 1

var player: CharacterBody2D
var sucessful : bool
var holding : bool
var numberCards = 0
var playerLoving = 0
var playerInTheScene : int
var launched : bool

func _ready():
	pass
		

	
func _process(delta):
	if playerLoving == playerInTheScene and playerInTheScene > 0 :
		#await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://scenes/vitoria.tscn")
	
	# DEBUG: Atalho para reiniciar cena
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().reload_current_scene();
