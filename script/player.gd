extends CharacterBody2D

const SPEED = 300
const JUMP_VELOCITY = -400.0
var collinding : bool = false
var hitted : bool = true
@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready():
	Global.player = self

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 980

func _process(delta):
	print(collinding)
	if Global.cartasDesbloqueadas == 3:
		get_tree().change_scene_to_file("res://scenes/vitoria.tscn")
	stateAnimation()

func stateAnimation():
	var _state = "Idle"
	if collinding:
		_state = "Happy"
	if Global.numberCards == 0:
		_state = "Die"
	animated_sprite_2d.play(_state)

func _on_area_2d_body_entered(body):
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	Global.playerLoving +=1
	collinding = true
	
	
