extends Node

var cartasDesbloqueadas: int = 0

var player: CharacterBody2D
var sucessful : bool
var holding : bool
var numberCards = 0
var playerLoving = 0
var playerInTheScene : int
var launched : bool

var somente_uma_vez: bool = true

func _ready():
	pass
	
func _process(delta):
	if playerLoving == playerInTheScene and playerInTheScene > 0 and somente_uma_vez :
		#await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://scenes/vitoria.tscn")
		somente_uma_vez = false
	
	# DEBUG: Atalho para reiniciar cena
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().reload_current_scene();
