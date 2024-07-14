extends Node2D

@onready var text = $TextureRect/Text
@onready var timer = $Timer

var visibleButton = 0

# Dicionário para armazenar mensagens de cada cena
var msg_queues: Dictionary = {
	"Tutorial": [
		"Olá, preparamos um pequeno tutorial para\nensinar você a entragar mensagens de amor\ne aquecer esse mundo gelado...
		
		(Pressione ENTER para passar a mensagem...)",
		"Caso não queira passar pelo tutorial\n e já saiba como conseguir um amor,\n pressione o botão (Continue); caso contrário,\n pressione (Me ensine).
		
		(Pressione ENTER para visualizar as opções...)"
	],
	"CartaDesbloqueadas": [
		"Mensagem 1 da cena 2...",
		"Mensagem 2 da cena 2..."
	],
	
}

func _ready():
	# Mostra a primeira mensagem da cena atual quando o jogo inicia
	show_message()

func _process(delta):
	
	var conteiner_box_dialog = get_parent()
	
	var skipButton = conteiner_box_dialog.get_node("SkipButton")
	var continueButton = conteiner_box_dialog.get_node("ContinueButton")
	
	if conteiner_box_dialog.global_position.y >= 250:
		conteiner_box_dialog.global_position.y -= 0.2

	if text.visible_characters == text.text.length() and visibleButton % 2 == 0 and visibleButton != 0:
		var current_scene: String = get_tree().current_scene.name
		if current_scene == "Tutorial":
			skipButton.visible = true
			continueButton.visible = true
	
func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept"):
		visibleButton += 1
		show_message()

func show_message():
	
	var current_scene: String = get_tree().current_scene.name

	if not timer.is_stopped():
		text.visible_characters = text.text.length()
		return

	if msg_queues[current_scene].size() == 0:
		#hide()
		return

	var _msg: String = msg_queues[current_scene].pop_front()
	
	text.visible_characters = 0
	text.text = _msg
	timer.start()

func _on_timer_timeout():
	if text.visible_characters == text.text.length():
		timer.stop()
	else:
		text.visible_characters += 1


	
