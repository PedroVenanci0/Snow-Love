extends Node2D

@onready var player = $Player
@onready var player_2 = $Player2


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.numberCards = 4


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
