class_name ColorLane extends Node2D

@export var color: GlobalConsts.Colors


func _ready() -> void:
	_set_color_to(GlobalConsts.COLORS[color])


func _set_color_to(color: Color) -> void:
	$BottomColor.color = color
	$LaneColor.color = color


func colorshift_left() -> void:
	color = posmod(color + 1, 3)
	_set_color_to(GlobalConsts.COLORS[color])


func colorshift_right() -> void:
	color = posmod(color - 1, 3)
	_set_color_to(GlobalConsts.COLORS[color])
