extends CharacterBody2D

const SPEED = 300
const JUMP_VELOCITY = -400.0
var collinding : bool = false
var hitted : bool = true
var Die : bool = false
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
	if Global.numberCards == 0:
		Die = true

func stateAnimation():
	var _state = "Idle"
	if Die:
		_state = "sad"
		animated_sprite_2d.play("sad")
		set_process(false)
		await animated_sprite_2d.animation_finished
		animated_sprite_2d.pause()
			
	else:	
		if collinding:
			_state = "Happy"
		animated_sprite_2d.play(_state)

func _on_area_2d_body_entered(body):
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	Global.playerLoving +=1
	collinding = true
	
	
