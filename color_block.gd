class_name ColorBlock extends Node2D

const COLORS: Array[Color] = [
		Color.CRIMSON,
		Color.LIME_GREEN,
		Color.ROYAL_BLUE
]

var _color_pointer: Colors.Colors
var color_lane: ColorLane
var level: int

func _ready() -> void:
	_set_color_to(COLORS[_color_pointer])
	position = color_lane.position - Vector2(0, 80 * level)

func _set_color_to(color: Color) -> void:
	$BlockColor.color = color

func assign_color(color: int) -> void:
	_color_pointer = color

func go_down_level() -> void:
	level -= 1
	position = color_lane.position - Vector2(0, 80 * level)
