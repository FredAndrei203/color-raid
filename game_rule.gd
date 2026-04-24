class_name GameRule extends Node

@export var block_cont: BlockContainer

var block_queue: Array[ColorBlock]

func initialize_level() -> void:
	for level in range(10):
		block_queue.append(block_cont.add_block())

func judge_current_state(event: InputEvent) -> void:
	var block: ColorBlock = block_queue.pop_front()
	if block.color == block.color_lane.color:
		print("SUCCESS")
	else:
		print("FAIL")
	block.queue_free()
	block_queue.append(block_cont.add_block())
	block_cont.bring_down_blocks()
