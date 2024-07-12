extends Line2D
class_name Trials

var queue : Array
@export var MaxLenght : int

func _process(delta):
	var pos = _get_position()
	queue.push_front(pos)
	
	if queue.size() > MaxLenght:
		queue.pop_back()
		
	clear_points()
	for point in queue: 
		add_point(point)
		

func _get_position():
	return get_parent().position
