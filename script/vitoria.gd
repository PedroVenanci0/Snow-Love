extends Control
@onready var label_vitoria = $Label3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label_vitoria.text = str(Global.cartasDesbloqueadas)

func _on_button_menu_princiapl_pressed():
	Global.TransitonToScene("res://scenes/menu_principal.tscn")
