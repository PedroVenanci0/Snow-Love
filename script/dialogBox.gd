extends Node2D

@onready var text = $TextureRect/Text
@onready var timer = $Timer

@onready var skip_button = $"../SkipButton"
@onready var continue_button = $"../ContinueButton"
@onready var proximo_nivel_button = $"../ProximoNivelButton"

@onready var color_rect = $"../ColorRect"

var verificacaoUnica = 1


# Dicionário para armazenar mensagens de cada cena
var msg_queues: Dictionary = {
	"Tutorial": [
		"Olá, preparamos um pequeno tutorial para\nensinar você a entragar mensagens de amor\ne aquecer esse mundo gelado...
		
		(Pressione ENTER para passar a mensagem...)",
		"Caso não queira passar pelo tutorial\ne já saiba como conseguir um amor,\npressione o botão (Skip); caso contrário,\npressione (Continue).",
		
		"Usando o cursos do mouse, click e arraste\nna tela para impulsionar a carta em direção\nos bonecos de neve, encontrados nas\nplataformas.",
		
		"Ao acertar os Bonecos de Neve, perceba que aparece\num coração acima de sua cabeça significando\nque o acertou, seu obejtivo é acertar\n os dois bonecos para enfim passar de fase.",
		
		"Parabens, vc finalmente conseguiu passar pelo Tutorial!!!\nPressione (Novo nivel para avançar.)"
	
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
	
	var current_scene: String = get_tree().current_scene.name
	
	var conteiner_box_dialog = get_parent()
	
	var skipButton = conteiner_box_dialog.get_node("SkipButton")
	var continueButton = conteiner_box_dialog.get_node("ContinueButton")
	
	if conteiner_box_dialog.global_position.y >= 250:
		conteiner_box_dialog.global_position.y -= 0.2

	if msg_queues[current_scene].size() == 3:
		skipButton.visible = true
		continueButton.visible = true
	
func _input(event):
	
	var current_scene: String = get_tree().current_scene.name
	
	if event is InputEventKey and event.is_action_pressed("ui_accept") and msg_queues[current_scene].size() == 4 and text.visible_characters == text.text.length():
		show_message()
		
	if Global.acertouTutorial == true and verificacaoUnica == 1:
		show_message()
		Global.acertouTutorial == false
		verificacaoUnica += 1
	
	if Global.playerLoving == 2 and current_scene == "Tutorial":
		show_message()
		if text.visible_characters == text.text.length():
			proximo_nivel_button.visible = true

func show_message():
	
	var current_scene: String = get_tree().current_scene.name
	
	print(msg_queues[current_scene].size())
#
	#if not timer.is_stopped():
		#text.visible_characters = text.text.length()
		#return
#
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

func _on_continue_button_pressed():
	
	if text.visible_characters == text.text.length():
		
		text.set("theme_override_colors/font_color", Color(1, 0, 0))
		
		show_message()
		
		skip_button.visible = false
		continue_button.visible = false
		
		await get_tree().create_timer(0.1).timeout
		
		get_tree().paused = false
		color_rect.visible = false
