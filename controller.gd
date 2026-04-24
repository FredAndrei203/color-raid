class_name Controller extends Node

@export var left_helper: ColorLane
@export var lane1: ColorLane
@export var lane2: ColorLane
@export var lane3: ColorLane
@export var right_helper: ColorLane
@export var game_rule: GameRule


func _unhandled_input(event: InputEvent) -> void:
	var shifting_event: bool = (
			event.is_action_pressed("shift_left") or
			event.is_action_pressed("shift_right")
	)
	var input_event: bool = (
			event.is_action_pressed("keep_colors")
	)
	if shifting_event:
		shift_lanes(event)
	elif input_event:
		game_rule.judge_current_state(event)

func shift_lanes(event: InputEvent) -> void:
	var lanes: Array[ColorLane] = [
			left_helper, lane1, lane2, lane3, right_helper
		]
	if event.is_action("shift_left"):
		for lane in lanes:
			lane.colorshift_left()
	else:
		for lane in lanes:
			lane.colorshift_right()
	game_rule.judge_current_state(event)
