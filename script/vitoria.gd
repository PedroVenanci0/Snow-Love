extends Control
@onready var label_vitoria = $Label3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	label_vitoria.text = str(Global.numberCards)

func _on_button_menu_princiapl_pressed():
	get_tree().change_scene_to_file("res://scenes/menu_principal.tscn")
