extends CharacterBody2D

const SPEED = 300
const JUMP_VELOCITY = -400.0
var collinding : bool = false
var hitted : bool = true
var Die : bool = false
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var coração = $"Coração1"

func _ready():
	Global.player = self

var gravity = 980

func _process(delta):
	print(collinding)
	if Global.cartasDesbloqueadas == 3:
		get_tree().change_scene_to_file("res://scenes/vitoria.tscn")
	stateAnimation()
	if Global.numberCards == 0:
		Die = true

func stateAnimation():
	var _state = "Idle"
	coração.visible = false
	if Die:
		await get_tree().create_timer(3.2).timeout
		_state = "sad"
		animated_sprite_2d.play("sad")
		set_process(false)
		await animated_sprite_2d.animation_finished
		animated_sprite_2d.stop()
	else:	
		if collinding:
			_state = "Happy"
			animated_sprite_2d.play(_state)
			coração.visible = true
			await get_tree().create_timer(1).timeout
			coração.visible = false
		else:
			_state = "Idle"
			animated_sprite_2d.play(_state)

func _on_area_2d_body_entered(body):
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	Global.playerLoving += 1
	collinding = true
