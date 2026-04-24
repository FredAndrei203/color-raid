class_name GameRule extends Node

@export var block_scene: PackedScene
@export var lane1: ColorLane
@export var lane2: ColorLane
@export var lane3: ColorLane

var block_queue: Array[ColorBlock]

func initialize_level() -> void:
	var lanes := [lane1, lane2, lane3]
	for level in range(10):
		var block: ColorBlock = block_scene.instantiate()
		block.color_lane = lanes[randi() % lanes.size()]
		block.assign_color(randi() % Colors.Colors.size())
		block.level = level
		block_queue.append(block)
		add_child(block)
