class_name ColorLane extends Node2D

const COLORS: Array[Color] = [
		Color.DARK_RED,
		Color.DARK_GREEN,
		Color.DARK_BLUE
]

@export var _color_pointer: Colors.Colors


func _ready() -> void:
	_set_color_to(COLORS[_color_pointer])


func _set_color_to(color: Color) -> void:
	$BottomColor.color = color
	$LaneColor.color = color


func colorshift_left() -> void:
	_color_pointer = (_color_pointer + 1) % 3
	_set_color_to(COLORS[_color_pointer])


func colorshift_right() -> void:
	_color_pointer = (_color_pointer + 1) % 3
	_set_color_to(COLORS[_color_pointer])
