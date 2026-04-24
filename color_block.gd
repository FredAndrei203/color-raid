class_name ColorBlock extends Node2D

const COLORS: Array[Color] = [
		Color.CRIMSON,
		Color.LIME_GREEN,
		Color.ROYAL_BLUE
]

var color: int
var color_lane: ColorLane

func _ready() -> void:
	_set_color_to(COLORS[color])

func _set_color_to(color: Color) -> void:
	$BlockColor.color = color
