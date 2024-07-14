extends Node2D

@onready var player = $Player
@onready var player_2 = $Player2

func _ready():
	Global.playerInTheScene = 0
	Global.numberCards = 4
