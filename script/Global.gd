extends Node

var cartasDesbloqueadas: int = 1

var player: CharacterBody2D
var sucessful : bool
var holding : bool
var numberCards = 0

var cardsWords: Dictionary = {
	"NumberCards_01": 2,
	"NumberCards_02": 3,
	"NumberCards_03": 4,
} 

func _ready():
		
	var currentScene = get_tree().current_scene.name if get_tree().current_scene != null else ""
	print(numberCards)
	
	match currentScene:
		"world_01": 
			numberCards = cardsWords.get("NumberCards_01")
		"world_02":
			numberCards = cardsWords.get("NumberCards_02")
		"menu_principal":
			numberCards = cardsWords.get("NumberCards_01")
	
func _process(delta):
	pass
			
			
	# DEBUG: Atalho para reiniciar cena
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().reload_current_scene();
