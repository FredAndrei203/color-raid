class_name ColorLane extends Node2D

const DELAY: int = 1
const ADVANCE: int = -1

@export var color: GlobalConsts.Colors

func _ready() -> void:
	_set_color_to(GlobalConsts.COLORS[color])


func _set_color_to(color: Color) -> void:
	$BottomColor.color = color
	$LaneColor.color = color


func colorshift_left() -> void:
	color = posmod(color + DELAY, GlobalConsts.COLORS.size())
	_set_color_to(GlobalConsts.COLORS[color])


func colorshift_right() -> void:
	color = posmod(color + ADVANCE, GlobalConsts.COLORS.size())
	_set_color_to(GlobalConsts.COLORS[color])
