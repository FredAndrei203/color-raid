class_name ColorBlock extends Node2D

var color: GlobalConsts.Colors:
	set(new_color):
		color = new_color
		$BlockColor.color = GlobalConsts.COLORS[color]
var color_lane: ColorLane
