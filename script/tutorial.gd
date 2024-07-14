extends Node2D

@onready var conteiner_box_dialog = $conteiner_box_dialog

@onready var skip_button = $conteiner_box_dialog/SkipButton
@onready var continue_button = $conteiner_box_dialog/ContinueButton


@onready var player = $Player
@onready var player_2 = $Player2

func _ready():
	Global.playerInTheScene = 0
	Global.numberCards = 4

func _process(delta):
	if conteiner_box_dialog.global_position.y >= 250:
		conteiner_box_dialog.global_position.y -= 0.2

	#if conteiner_box_dialog.global_position.y == 250:
		#skip_button.visible = true
		#continue_button.visible = true

func _on_skip_button_pressed():
	pass 

func _on_continue_button_pressed():
	conteiner_box_dialog.visible = false
