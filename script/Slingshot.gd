extends Node2D

@export var projectile : RigidBody2D
var holding: bool = false;
var launched: bool = false;
var successful: bool = false;

func _draw():
	var points = [
		$SlingshotPart1/Point,
		$SlingshotPart2/Point
	]
	for i in range(len(points)):
		var point = points[i];
		var _col = Color(0.0, 0.20 - 0.10 * int(i == 0), 0.95 - 0.30 * int(i == 0));
		draw_line(point.position, projectile.position, _col, 4.0);

func _process(delta):
	# Atualizar função de desenho
	queue_redraw();
	
	# Get Input
	holding = Input.is_action_pressed("mouse_button");
	
	if Input.is_action_just_released("mouse_button") and !successful:
		print("Catapimbas lá vai carta carai")
		var _dragEnd = get_global_mouse_position()
		var dir = position - _dragEnd;
		projectile.apply_impulse(dir * 5)
		successful = true;
		launched = true;
	
	# Posicionar carta no estilingue
	if !holding and !launched and !successful:
		projectile.global_position = position;
	elif holding and !launched:
		#projectile.global_position = get_global_mouse_position()
		var _vector = position - get_global_mouse_position();
		var _angle = _vector * -1;
		_angle = _angle.angle();
		var _l = min(_vector.length(), 64)
		projectile.global_position.x = position.x + cos(_angle) * _l;
		projectile.global_position.y = position.y + sin(_angle) * _l;		
			
	if launched:
		launched = false;
