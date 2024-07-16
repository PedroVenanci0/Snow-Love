extends Node2D

@onready var conteiner_box_dialog = $conteiner_box_dialog

@onready var skip_button = $conteiner_box_dialog/SkipButton
@onready var continue_button = $conteiner_box_dialog/ContinueButton
@onready var amor_gelado = $Sounds/Amor_gelado



@onready var player = $Player
@onready var player_2 = $Player2

func _ready():
	Global.playerLoving = 0
	Global.playerInTheScene = 0
	Global.numberCards = 4
	await get_tree().create_timer(0.3).timeout
	get_tree().paused = true
	amor_gelado.playing = true

func _process(delta):
	pass

func _on_skip_button_pressed():
	get_tree().paused = false
	await get_tree().create_timer(1).timeout
	Global.TransitonToScene("res://scenes/world_01.tscn")

func _on_proximo_nivel_button_pressed():
	await get_tree().create_timer(1).timeout
	Global.TransitonToScene("res://scenes/world_01.tscn")
