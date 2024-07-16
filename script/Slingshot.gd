extends Node2D

@export var projectile : RigidBody2D

## Estado do estilingue em que estamos segurando o clique.
var holding: bool = false;

## Guarda o instante que a carta foi arremessada.
var launched: bool = false;

## Arremessou a carta com sucesso
var successful: bool = false;

## Distancia max pra puxar o estilingue
var slingshotMaxLength: float = 50.0;

## Posição da corda
var slingPos: Vector2 = Vector2.ZERO

## Launch Direction
var launchDir: Vector2 = Vector2.ZERO

func _draw():
	var points = [
		$SlingshotPart1/Point,
		$SlingshotPart2/Point
	]
	for i in range(len(points)):
		var point = points[i];
		var _col = Color(0.0, 0.20 - 0.10 * int(i == 0), 0.95 - 0.30 * int(i == 0));
		
		var _destPos = projectile.position - position if !successful else Vector2(-20.0, 2.0);
		slingPos = slingPos.lerp(_destPos, 0.20);
		draw_line(point.position, slingPos, _col, 4.0);
	
	# Draw trajectory
	if holding:
		draw_line(Vector2.ZERO, Vector2.ZERO + launchDir * 2 , Color.RED, 4);
	

func _process(delta):
	Global.launched = launched
	# Atualizar função de desenho
	queue_redraw();
	
	# Pega o Input
	if !successful:
		holding = Input.is_action_pressed("mouse_button");
		Global.holding = holding;
	
	if Input.is_action_just_released("mouse_button") and !successful:
		launchCard();
		
	# Posicionar carta no estilingue
	if !holding and !successful and !launched:
		projectile.rotation = 0
		projectile.global_position = position;
		
	elif holding and !launched:
		#projectile.global_position = get_global_mouse_position()
		var _vector = position - get_global_mouse_position();
		var _angle = _vector * -1;
		_angle = _angle.angle();
		var _l = min(_vector.length(), slingshotMaxLength);
		projectile.global_position.x = position.x + cos(_angle) * _l;
		projectile.global_position.y = position.y + sin(_angle) * _l;
		
		# Atualizar launchDir para fins de desenho da trajetoria
		launchDir = getLaunchDir();
			
	if launched:
		launched = false;

func getLaunchDir():
	var _size = 50;
	var _dragEnd = get_local_mouse_position();
	_dragEnd.x = clamp(get_local_mouse_position().x, 0 - _size, 0 + _size);
	_dragEnd.y = clamp(get_local_mouse_position().y, 0 - _size, 0 + _size);
	var _dir = Vector2(0, -10) - _dragEnd;
	#print("Dir: %s - %s " % [position, _dragEnd])
	return _dir;

func launchCard():
	
	var current_scene: String = get_tree().current_scene.name
	
	#print("Catapimbas lá vai carta carai");
	var _dir = getLaunchDir();
	projectile.linear_velocity = Vector2.ZERO;
	projectile.apply_impulse(_dir * 10.5);

	successful = true;
	Global.numberCards -= 1
	Global.sucessful = true;
	launched = true;
	await get_tree().create_timer(2.5).timeout
	
	if Global.numberCards == 0 and current_scene != "Tutorial":
		await get_tree().create_timer(2.5).timeout
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	successful = false
	
	
