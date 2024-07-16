extends ColorRect

# Tempo total da transição em segundos
@export var transition_time: float = 2.0
var timer: float = 0.0

# Referência ao material do shader
var shader_material: ShaderMaterial

# Variável para determinar o tipo de transição (abrindo ou fechando)
var is_opening: bool = true

# Caminho da próxima cena a ser carregada
var next_scene_path: String = ""

# Sinal para notificar quando a transição terminar
#@signal transition_finished

func _ready():
	# Obtenha o material do shader do nó (ajuste conforme necessário)
	shader_material = self.material as ShaderMaterial
	# Inicie a transição de abertura
	start_opening_transition()

func start_opening_transition():
	is_opening = true
	timer = 0.0
	set_process(true)

func start_closing_transition(scene_path: String):
	is_opening = false
	next_scene_path = scene_path
	timer = 0.0
	set_process(true)

func _process(delta: float):
	if timer < transition_time:
		# Incrementa o tempo
		timer += delta
		# Calcula o progresso da transição
		var progress = clamp(timer / transition_time, 0.0, 1.0)
		# Ajusta o progresso com base no tipo de transição
		if is_opening:
			shader_material.set_shader_parameter("progress", progress)
		else:
			shader_material.set_shader_parameter("progress", 1.0 - progress)
	else:
		set_process(false)
		if is_opening:
			# A transição de abertura terminou
			emit_signal("transition_finished")
		else:
			# A transição de fechamento terminou, troque de cena
			Global.transitionToScene(next_scene_path)

func change_scene(scene_path: String):
	# Inicia a transição de fechamento
	start_closing_transition(scene_path)

# Método para iniciar a transição de cena, pode ser chamado de outros scripts
func _input(event: InputEvent):
	if event.is_action_pressed("ui_accept"):
		change_scene("res://scenes/vitoria.tscn")
