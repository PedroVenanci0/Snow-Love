extends Node2D

@onready var text = $TextureRect/Text
@onready var timer = $Timer

# Dicionário para armazenar mensagens de cada cena
var msg_queues: Dictionary = {
	"Tutorial": [
		"Olá, preparamos um pequeno tutorial para\n ajudar você a encontrar o amor\n neste mundo gelado...",
		"Caso não queira passar pelo tutorial\n e já saiba como conseguir um amor,\n pressione o botão (SKIP); caso contrário,\n pressione (Continuar)."
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
	pass
	
func _input(event):
	if event is InputEventKey and event.is_action_pressed("ui_accept"):
		show_message()

func show_message():
	
	var current_scene: String = get_tree().current_scene.name

	if not timer.is_stopped():
		text.visible_characters = text.text.length()
		return

	if msg_queues[current_scene].size() == 0:
		hide()
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


	
