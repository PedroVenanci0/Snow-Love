extends CanvasLayer
@onready var label = $Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.numberCards > 0:
		label.text = str(Global.numberCards)
	if Global.numberCards <= 0:
		Global.numberCards = 0
		label.text = str(Global.numberCards)
		
