class_name ColorBlock extends Node2D

const COLORS: Array[Color] = [
		Color.RED,
		Color.GREEN,
		Color.BLUE
]

var color: GlobalConsts.Colors
var color_lane: ColorLane

func _ready() -> void:
	$BlockColor.color = GlobalConsts.COLORS[color]
