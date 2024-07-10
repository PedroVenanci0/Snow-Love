extends RigidBody2D

var impulse_strength = 1000  # Força do impulso inicial

func _ready():
	pass

# Chamada quando outro corpo entra na área do bloco
func _on_body_entered(body):
	var direction = (body.global_position - global_position).normalized()
	apply_impulse_to_block(direction, impulse_strength)
	print("entrei")

# Função para aplicar um impulso ao bloco
func apply_impulse_to_block(direction, strength):
	$RigidBody2D.apply_impulse(Vector2.ZERO, direction.normalized() * strength)
	print("agora")

