extends RigidBody2D
class_name Card

@onready var line_2d = $Line2D
@onready var player = $"../Player"
@onready var player_2 = $"../Player2"
var trail: Line2D = null
@onready var animated_sprite_2d = $AnimatedSprite2D
# Lista para armazenar os pontos do rastro
var trail_points = []

# Tempo entre atualizações dos pontos do rastro (em segundos)
var trail_update_interval = 0.1
var time_since_last_update = 0.0

# Duração máxima do rastro (em segundos)
var trail_duration = 2.0

var dragging 
var dragStart = Vector2.ZERO;
var initialPos = Vector2.ZERO;

func _ready():
	show_trail()
	# Inicialize o rastro com o ponto inicial
	trail_points.append(global_position)
	# Define a posição inicial da carta
	initialPos = position;

func _process(delta):
	if global_position.y > 271 and !Global.sucessful or Global.holding:
		$CollisionShape2D.set_deferred("disabled", true)
	elif global_position.y < 260 and Global.sucessful:
		$CollisionShape2D.set_deferred("disabled", false)
	
		
	if  Global.sucessful and trail == null:
		show_trail()
	elif Global.sucessful:
		trail.visible = true
	else:
		trail.visible = false

	if dragging == false:
		pass
		#global_position = Vector2(0.0, 10.0)
	
	if position.y > 800:
		position = initialPos;
		linear_velocity = Vector2.ZERO;

func _on_body_entered(body):
	var direcao = -(body.position - self.position).normalized()
	var velocidade_corpo = body.linear_velocity
	var velocidade_relativa = velocidade_corpo - linear_velocity / 2
	var impulso = direcao * velocidade_relativa.length() * mass
	apply_impulse(impulso, Vector2.ZERO)

func show_trail() -> void:
	trail = TrailEffect.createTrail()
	add_child(trail)
