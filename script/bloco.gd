extends RigidBody2D

var hits : int
func _ready():
	pass

func _process(delta):
	if hits == 2:
		queue_free()
# Chamado quando outro corpo entra na área do bloco
func _on_area_2d_body_entered(body):
	hits += 1
	if body is RigidBody2D:
		var direcao = -(body.position - self.position).normalized()
		var velocidade_corpo = body.linear_velocity
		var velocidade_relativa = velocidade_corpo - linear_velocity
		var impulso = (direcao * velocidade_relativa.length() * mass) / 1.5
		apply_impulse(impulso, Vector2.ZERO)

