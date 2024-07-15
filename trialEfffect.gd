extends Line2D
class_name TrailEffect

const MAX_POINTS = 15
var trail

# Called when the node enters the scene tree for the first time.

func _ready():
	trail = Curve2D.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	trail.add_point(get_parent().position)
	if trail.get_baked_points().size() > MAX_POINTS:
		trail.remove_point(0)
		points = trail.get_baked_points()

static func createTrail() -> TrailEffect:
	var trail_scene = preload("res://scenes/trial_efffect.tscn")
	return trail_scene.instantiate()

func _on_timer_timeout():
	pass
