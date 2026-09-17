class_name TouchController extends Controller

var initial: Vector2 = Vector2.ZERO
var deadzone: float = 50
var touching: bool = false
var touch_index: int = -1

func get_input_direction(event: InputEvent) -> Vector2:
	print("YELL")
	if event is InputEventScreenTouch:
		if event.pressed and touch_index == -1:
			initial = event.position
			touch_index = event.index
			touching = true
			print("Touching...")
		elif not event.pressed and touch_index == event.index:
			touch_index = -1
			touching = false
			print("Released")
	elif event is InputEventScreenDrag:
		if not (touching and touch_index == event.index):
			return Vector2.ZERO
		var delta: Vector2 = event.position - initial
		if delta.length() >= deadzone:
			print("EXECUTE")
			touching = false
			if abs(delta.x) >= abs(delta.y):
				return Vector2(sign(delta.x), 0)
			else:
				if delta.y > 0:
					return Vector2.DOWN
	return Vector2.ZERO
