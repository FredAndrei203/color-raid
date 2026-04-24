class_name BlockContainer extends Node2D

const ONE_LVL: float = 80

@export var block_scene: PackedScene
@export var lane1: ColorLane
@export var lane2: ColorLane
@export var lane3: ColorLane

var total_block_count: int


func bring_down_blocks() -> void:
	position.y += ONE_LVL

func add_block() -> ColorBlock:
	var lanes: Array[ColorLane] = [lane1, lane2, lane3]
	var block: ColorBlock = block_scene.instantiate()
	block.color_lane = lanes[randi() % lanes.size()]
	block.color = (randi() % GlobalConsts.Colors.size())
	var level: Vector2 = Vector2(0, ONE_LVL * total_block_count)
	add_child(block)
	block.position = block.color_lane.position - level
	total_block_count += 1
	return block
