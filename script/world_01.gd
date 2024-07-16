extends Node2D

@onready var amor_pixelado = $Sounds/amor_pixelado


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.playerLoving = 0
	Global.playerInTheScene = 0
	Global.numberCards = 6

	amor_pixelado.playing = true

	Global.restart = "res://scenes/world_01.tscn"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	await get_tree().create_timer(1).timeout
	if Global.playerLoving == Global.playerInTheScene:
		$HUD_cards/Button.visible = true
	
func _on_button_pressed():
	Global.TransitonToScene("res://scenes/world_02.tscn")
