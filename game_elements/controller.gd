class_name Controller extends Node

@export var game_rule: GameRule

@export var lanes: Array[ColorLane]

var enabled: bool = false

func _unhandled_input(event: InputEvent) -> void:
	if !enabled:
		return
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
	if event.is_action("shift_left"):
		for lane in lanes:
			lane.colorshift_left()
	else:
		for lane in lanes:
			lane.colorshift_right()
	game_rule.judge_current_state(event)
