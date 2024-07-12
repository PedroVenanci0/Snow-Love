extends RigidBody2D
class_name Card

@onready var player = $"../Player"
@onready var player_2 = $"../Player2"

@onready var animated_sprite_2d = $AnimatedSprite2D


var dragging 
var dragStart = Vector2.ZERO;
var initialPos = Vector2.ZERO;

func _ready():
	initialPos = position;

func _process(delta):
	if global_position.y > 271 and !Global.sucessful or Global.holding:
		$CollisionShape2D.set_deferred("disabled", true)
	elif global_position.y < 260 and Global.sucessful:
		$CollisionShape2D.set_deferred("disabled", false)
		
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



