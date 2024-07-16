extends CanvasLayer
class_name FadeIn

var timeFadeIn : float = 0.01;
var destinyScene : String;
var progress : float = 0.0;

func _process(delta):
	progress = move_toward(progress, 1.0, 0.005);
	$ColorRect.color.a = progress;
	if progress >= 1.0:
		queue_free();
