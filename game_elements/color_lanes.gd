class_name ColorLanes extends Node2D

@export var lanes: Array[ColorLane]
@export var play_lanes: Array[ColorLane]
@export var helper_lanes: Array[ColorLane]

func reset_lanes() -> void:
	if play_lanes.front().color != GlobalConsts.Colors.RED:
		for lane in lanes:
			lane.colorshift_left()
