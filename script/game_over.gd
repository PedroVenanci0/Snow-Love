extends Control

@onready var cartasconquistadas = $Label4
@onready var cartasconquitadas_shadow = $Label3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	cartasconquistadas.text = "Cartas desbloqueadas: " + " " +str(Global.cartasDesbloqueadas)
	cartasconquitadas_shadow.text = "Cartas desbloqueadas: " + " " +str(Global.cartasDesbloqueadas)
	
func _on_menu_principal_pressed():
	Global.TransitonToScene("res://scenes/menu_principal.tscn")

func _on_quit_game_pressed():
	get_tree().quit()

func _on_button_pressed():
	Global.TransitonToScene(Global.restart)
