class_name Controller extends Node

@export var game_rule: GameRule
@export var color_lanes: ColorLanes

static var enabled: bool = false

func _unhandled_input(event: InputEvent) -> void:
	if !enabled:
		return
	var input_direction: Vector2 = get_input_direction(event)
	if input_direction:
		shift_colors(input_direction)
	


func get_input_direction(event: InputEvent) -> Vector2:
	var direction: Vector2
	if Input.is_action_just_pressed("shift_left"):
		direction = Vector2.LEFT
	elif Input.is_action_just_pressed("shift_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_just_pressed("keep_colors"):
		direction = Vector2.DOWN
	print(direction)
	return direction


func shift_colors(dir: Vector2) -> void:
	if Vector2.LEFT == dir:
		for lane in color_lanes.lanes:
			lane.colorshift_left()
		print("LEFT")
		game_rule.judge_current_state()
	elif Vector2.RIGHT == dir:
		for lane in color_lanes.lanes:
			lane.colorshift_right()
		print("RIGHT")
		game_rule.judge_current_state()
	elif Vector2.DOWN == dir:
		print("DOWN")
		game_rule.judge_current_state()
