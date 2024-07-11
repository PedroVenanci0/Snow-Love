extends RigidBody2D

var dragging 
var dragStart = Vector2.ZERO;
var initialPos = Vector2.ZERO;

func _ready():
	initialPos = position;

func _process(delta):
	if dragging == false:
		pass
		#global_position = Vector2(0.0, 10.0)
	
	if position.y > 800:
		position = initialPos;
		linear_velocity = Vector2.ZERO;
		
func _input(event):
	pass
	#if event.is_action_pressed("mouse_button") and !dragging:
		#dragging = true
		#dragStart = get_global_mouse_position()
	#if event.is_action_released("mouse_button") and dragging:
		#dragging = false
		#var _dragEnd = get_global_mouse_position()
		#var dir = dragStart - _dragEnd
		#apply_impulse(dir * 5)

