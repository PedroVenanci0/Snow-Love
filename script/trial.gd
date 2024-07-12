extends Line2D

var queue : Array
@export var MaxLenght : int

func _process(delta):
	var pos = get_parent().position
	queue.push_front(pos)
	
	if queue.size() > MaxLenght:
		queue.pop_back()
		
	clear_points()
	for point in queue: 
		add_point(point)

func _get_position():
	return get_global_mouse_position()
