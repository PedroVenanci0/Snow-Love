extends Node

var cartasDesbloqueadas: int = 1

var player: CharacterBody2D
var sucessful : bool
var holding : bool
var numberCards = 0
var playerLoving = 0
var playerInTheScene : int
var launched : bool
var acertouTutorial: bool = false
var restart : String
var somente_uma_vez: bool = true

func _ready():
	pass
	
func _process(delta):
	#var current_scene: String = get_tree().current_scene.name if get_tree().current_scene != null else ""
	
	#if playerLoving == playerInTheScene and playerInTheScene > 0 and somente_uma_vez and current_scene != "Tutorial":
		##await get_tree().create_timer(1.5).timeout
		#get_tree().change_scene_to_file("res://scenes/vitoria.tscn")
		#somente_uma_vez = false
	
	# DEBUG: Atalho para reiniciar cena
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().reload_current_scene();
		
func TransitonToScene(destinyScene):
	var fadeIn = preload("res://scenes/fade_in.tscn")
	fadeIn.instantiate()
	get_tree().change_scene_to_file(destinyScene)
