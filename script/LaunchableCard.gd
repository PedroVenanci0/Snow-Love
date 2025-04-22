extends RigidBody2D

var mousePos := Vector2.ZERO;
var pressed: bool = false;

# Variáveis de lançamento
var originalPos := Vector2.ZERO;
var launched: bool = false;
var launchDir: Vector2 = Vector2.ZERO;


func _process(delta):
	# Obter posicao do mouse
	mousePos = get_global_mouse_position()
	#print("Mousepos: ", mousePos)
	
	if pressed:
		position = mousePos;
	
	if launched:
		var velocity = launchDir * 0.10;
		velocity.y += 1;
		move_and_collide(velocity)

func _input(event):
	if event is InputEventMouseButton:
		# Saber se eu pressionei
		if event.is_pressed():
			#print("segurando")	
			pressed = true;
			launched = false;
			originalPos = global_position;
			#print("Posição original: ", originalPos)
			
		# Ou se soltei
		if event.is_released():
			#print("solto")
			pressed = false;
			
			# Calcular a diferença entre a origem e o atual.
			# Essa diferença (vec2) vai ser o launchDir
			launched = true;
			launchDir = global_position - originalPos;
			launchDir *= Vector2(-1, -1);
			#print("Soltei na posiçao: ", global_position)
			#print("Criando portanto um launchDir de ", launchDir)
