class_name BlockContainer extends Node2D

const ONE_LVL: float = 80
const MAXIMUM_COUNT: int = 7

@export var block_scene: PackedScene
@export var color_lanes: ColorLanes

var block_pool: Array[ColorBlock]
var block_queue: Array[ColorBlock]
var initialized: bool = false


func _supply_block() -> ColorBlock:
	var block: ColorBlock
	if block_pool.is_empty():
		block = block_scene.instantiate()
		$Animatable2D.add_child(block)
	else:
		block = block_pool.pop_front()
	return block

func enqueue_block() -> void:
	var block: ColorBlock = _supply_block()
	var lanes: Array[ColorLane] = color_lanes.play_lanes
	block.color_lane = lanes[randi() % lanes.size()]
	block.color = (randi() % GlobalConsts.Colors.size())
	var offset: float = ONE_LVL * block_queue.size()
	var level: Vector2 = Vector2(0, offset)
	block.global_position = block.color_lane.global_position - level
	block_queue.append(block)
	block.inflate_block()


func dequeue_block() -> void:
	var block: ColorBlock = block_queue.pop_front()
	block.deflate_block()
	block_pool.append(block)
	position.y += ONE_LVL
	$AnimationPlayer.play("RESET")
	$AnimationPlayer.play("move_down")
	
func reset_container() -> void:
	initialized = false
	while !block_queue.is_empty():
		dequeue_block()
	position = Vector2.ZERO

func initialize_lanes() -> void:
	if initialized:
		return
	initialized = true
	for level in range(MAXIMUM_COUNT):
		enqueue_block()
	
	for times in range(10):
		var spare_block: ColorBlock = _supply_block()
		spare_block.deflate_block()
		block_pool.append(spare_block)
