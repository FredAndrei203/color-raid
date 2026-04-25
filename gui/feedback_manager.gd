class_name FeedbackManager extends Node

@export var feedbck_scene: PackedScene
@export var feedback_area: Control

var feedback_pool: Array[FeedbackObject]
var feedback_in_use: Array[FeedbackObject]


func _provide_object() -> FeedbackObject:
	var object: FeedbackObject
	if feedback_pool.is_empty():
		object = feedbck_scene.instantiate()
		feedback_pool.append(object)
		feedback_area.add_child(object)
		object.feedback_conveyed.connect(_return_object)
	else:
		object = feedback_pool.pop_back()
	
	return object
	

func _get_area_rand_pos() -> Vector2:
	var rand_x: float = randf_range(0, feedback_area.size.x)
	var rand_y: float = randf_range(0, feedback_area.size.y)
	return Vector2(rand_x, rand_y)


func show_positive_feedback() -> void:
	var feedback: FeedbackObject = _provide_object()
	var pos := _get_area_rand_pos()
	print(pos)
	feedback.position = _get_area_rand_pos()
	feedback.display_feedback_correct("Correct!")



func show_negative_feedback() -> void:
	var feedback: FeedbackObject = _provide_object()
	feedback.position = _get_area_rand_pos()
	feedback.display_feedback_wrong("Wrong!")


func return_all_existing_feedback() -> void:
	while !feedback_in_use.is_empty():
		var feedback: FeedbackObject = feedback_in_use.pop_front()
		feedback.return_self()


func _return_object(feedback: FeedbackObject) -> void:
	feedback_pool.append(feedback)
