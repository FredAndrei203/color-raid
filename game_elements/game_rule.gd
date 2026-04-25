class_name GameRule extends Node

signal game_ended
signal score_updated(score: int)

@export var timer: Timer
@export var block_container: BlockContainer


var score: int
var bonus_time: float = 5
var penalty_time: float = 1
var game_is_over: bool = false


func _handle_reward() -> void:
	score += 1
	timer.start(timer.time_left + bonus_time)
	bonus_time *= 0.90


func _handle_punishment() -> void:
	score -= 1
	var resultant_time: float = timer.time_left - penalty_time
	if resultant_time <= 0:
		timer.stop()
		game_is_over = true
	else:
		timer.start(resultant_time)
		penalty_time *= 1.25


func start_level() -> void:
	game_is_over = false
	score = 0
	score_updated.emit(score)
	bonus_time = GlobalConsts.DEFAULT_BONUS_TIME
	penalty_time = GlobalConsts.DEFAULT_PENALTY_TIME
	timer.start(GlobalConsts.DEFAULT_TIMER_LENGTH)


func judge_current_state(event: InputEvent) -> void:
	var block: ColorBlock = block_container.block_queue.front()
	if block.color == block.color_lane.color:
		_handle_reward()
	else:
		_handle_punishment()
	score_updated.emit(score)
	block_container.dequeue_block()
	block_container.enqueue_block()
	if game_is_over:
		game_over()


func game_over() -> void:
	game_ended.emit()


func _on_timer_timeout() -> void:
	game_over()
