class_name ColorLane extends Node2D

const COLORS: Array[Color] = [
		Color.DARK_RED,
		Color.DARK_GREEN,
		Color.DARK_BLUE
]

@export var color: GlobalConsts.Colors


func _ready() -> void:
	_set_color_to(COLORS[color])


func _set_color_to(color: Color) -> void:
	$BottomColor.color = color
	$LaneColor.color = color


func colorshift_left() -> void:
	color = (color + 1) % 3
	_set_color_to(COLORS[color])


func colorshift_right() -> void:
	color = (color - 1) % 3
	_set_color_to(COLORS[color])
