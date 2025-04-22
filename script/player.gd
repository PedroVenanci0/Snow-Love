extends CharacterBody2D

const SPEED = 300
const JUMP_VELOCITY = -400.0
var colliding : bool = false
var hitted : bool = true
var die : bool = false
var born : bool = true
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var coração = $"Coração1"

func _ready():
	Global.player = self

var gravity = 980

func _process(delta):
	if born:
		Global.playerInTheScene += 1
		born = false
	state_animation()
	if Global.numberCards == 0:
		die = true

func state_animation():
	var _state = "Idle"
	coração.visible = false
	if die and get_tree().current_scene.name != "Tutorial":
		await get_tree().create_timer(3.2).timeout
		_state = "sad"
		animated_sprite_2d.play("sad")
		set_process(false)
		await animated_sprite_2d.animation_finished
		animated_sprite_2d.stop()
	else:
		if colliding:
			_state = "Happy"
			animated_sprite_2d.play(_state)
			coração.visible = true
			await get_tree().create_timer(1).timeout
		else:
			_state = "Idle"
			animated_sprite_2d.play(_state)

func _on_area_2d_body_entered(body):
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	Global.playerLoving += 1
	colliding = true
	Global.acertouTutorial = true
	

