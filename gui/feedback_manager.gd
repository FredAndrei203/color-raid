class_name FeedbackManager extends Node

@export var feedback_objects: Array[FeedbackObject]

func show_feedback(positive) -> void:
	var msg: String
	if positive:
		msg = "CORRECT!"
	else:
		msg = "WRONG!"
	for object in feedback_objects:
		object.display_feedback(msg, positive)
