extends Control

@onready var carta_gelada_world_01 = $CartaGelada_world_01
@onready var carta_gelada_world_02 = $CartaGelada_world_02
@onready var carta_gelada_world_03 = $CartaGelada_world_03
@onready var carta_01 = $carta_01


var apertei_novamente = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#carta.scale = Vector2(0.1,0.1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if Global.cartasDesbloqueadas == 1:
		carta_gelada_world_01.modulate = Color(1, 1, 1, 1)
	if Global.cartasDesbloqueadas == 2:
		carta_gelada_world_02.modulate = Color(1, 1, 1, 1)
		
func _on_return_enu_pressed():
	Global.TransitonToScene("res://scenes/menu_principal.tscn")

func _on_button_card_01_pressed():
	if Global.cartasDesbloqueadas == 1:
		#carta_01.visible = true
		var _tween = get_tree().create_tween()
		_tween.tween_property(carta_01,"scale", Vector2(1,1), 0.25);
		apertei_novamente += 1
		if apertei_novamente % 2 == 0:
			_tween.tween_property(carta_01,"scale", Vector2(0,0), 0.25);
			#carta_01.visible = false
			pass
		#carta.scale = Vector2(3,3)

