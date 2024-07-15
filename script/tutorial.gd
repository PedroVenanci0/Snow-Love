extends Node2D

@onready var conteiner_box_dialog = $conteiner_box_dialog

@onready var skip_button = $conteiner_box_dialog/SkipButton
@onready var continue_button = $conteiner_box_dialog/ContinueButton


@onready var player = $Player
@onready var player_2 = $Player2

func _ready():
	
	Global.playerInTheScene = 0
	Global.numberCards = 4
	get_tree().paused = true

func _process(delta):
	pass

func _on_skip_button_pressed():
	pass 


