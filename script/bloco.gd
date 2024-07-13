extends RigidBody2D

func _ready():
	pass

# Chamado quando outro corpo entra na área do bloco
func _on_area_2d_body_entered(body):
	if body is RigidBody2D:
		var direcao = -(body.position - self.position).normalized()
		var velocidade_corpo = body.linear_velocity
		var velocidade_relativa = velocidade_corpo - linear_velocity
		var impulso = (direcao * velocidade_relativa.length() * mass) / 1.5
		apply_impulse(impulso, Vector2.ZERO)

