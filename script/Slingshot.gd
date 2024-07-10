extends Node2D

@export var projectile : RigidBody2D

func _process(delta):
	var lines = [
		$SlingshotPart1/Point/Line2D,
		$SlingshotPart2/Point/Line2D
	]
	
	for line in lines:
		line.points[1] = projectile.global_position
