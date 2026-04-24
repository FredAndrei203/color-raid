class_name BlockContainer extends Node2D

const ONE_LVL: float = 80
const MAXIMUM_COUNT: int = 7

@export var block_scene: PackedScene
@export var lanes: Array[ColorLane]

var block_deployment_count: int
var block_pool: Array[ColorBlock]

func bring_down_blocks() -> void:
	position.y += ONE_LVL

func _supply_block() -> ColorBlock:
	var block: ColorBlock
	if block_pool.is_empty():
		block = block_scene.instantiate()
		add_child(block)
	else:
		block = block_pool.pop_back()
		block.show()
	return block

func add_block() -> ColorBlock:
	var block: ColorBlock = _supply_block()
	block.color_lane = lanes[randi() % lanes.size()]
	block.color = (randi() % GlobalConsts.Colors.size())
	var level: Vector2 = Vector2(0, ONE_LVL * block_deployment_count)
	block.position = block.color_lane.position - level
	block_deployment_count += 1
	return block

func return_block(block: ColorBlock) -> void:
	block_pool.append(block)
	block.hide()
