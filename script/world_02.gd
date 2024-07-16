extends Node2D
@onready var boneco_de_neve = $Sounds/Boneco_de_neve


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Eu amo pinto")
	Global.playerLoving = 0
	Global.playerInTheScene = 0
	Global.numberCards = 10

	boneco_de_neve.playing = true

	Global.restart = "res://scenes/world_02.tscn"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	await get_tree().create_timer(1).timeout
	if Global.playerLoving == Global.playerInTheScene:
		$HUD_cards/Button.visible = true
