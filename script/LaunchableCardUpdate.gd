extends RigidBody2D

var dragging 
var dragStart = Vector2.ZERO

func _process(delta):
	if dragging == false:
		pass
		#global_position = Vector2(0.0, 10.0)
		
func _input(event):
	if event.is_action_pressed("mouse_button") and !dragging:
		dragging = true
		dragStart = get_global_mouse_position()
	if event.is_action_released("mouse_button") and dragging:
		dragging = false
		var _dragEnd = get_global_mouse_position()
		var dir = dragStart - _dragEnd
		apply_impulse(dir * 5)

