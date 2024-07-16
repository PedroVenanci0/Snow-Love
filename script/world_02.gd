extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.playerInTheScene = 0
	Global.numberCards = 10


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	await get_tree().create_timer(0.5).timeout
	if Global.playerLoving == Global.playerInTheScene:
		$HUD_cards/Button.visible = true
