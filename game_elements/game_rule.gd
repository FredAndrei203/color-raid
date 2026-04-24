class_name GameRule extends Node

signal game_ended
signal score_updated(score: int)

@export var block_cont: BlockContainer
@export var timer: Timer

var block_queue: Array[ColorBlock]
var score: int
var bonus_time: float = 5
var penalty_time: float = 1
var game_is_over: bool = false

func _handle_reward() -> void:
	score += 1
	timer.start(timer.time_left + bonus_time)
	bonus_time *= 0.75

func _handle_punishment() -> void:
	score -= 1
	var resultant_time: float = timer.time_left - penalty_time
	if resultant_time <= 0:
		timer.stop()
		game_is_over = true
	else:
		timer.start(resultant_time)
		penalty_time *= 1.25

func initialize_level() -> void:
	for level in range(block_cont.MAXIMUM_COUNT):
		block_queue.append(block_cont.add_block())

func start_level() -> void:
	initialize_level()
	timer.start()

func judge_current_state(event: InputEvent) -> void:
	var block: ColorBlock = block_queue.pop_front()
	if block.color == block.color_lane.color:
		_handle_reward()
	else:
		_handle_punishment()
	score_updated.emit(score)
	block_cont.return_block(block)
	block_queue.append(block_cont.add_block())
	block_cont.bring_down_blocks()
	if game_is_over:
		game_over()

func game_over() -> void:
	game_ended.emit()


func _on_timer_timeout() -> void:
	game_over()
