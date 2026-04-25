class_name FeedbackObject extends Node2D

signal feedback_conveyed(feedback: FeedbackObject)


func display_feedback_correct(feedback: String) -> void:
	show()
	$FeedbackLabel.text = feedback
	$AnimationPlayer.play("show_feedback_correct")


func display_feedback_wrong(feedback: String) -> void:
	show()
	$FeedbackLabel.text = feedback
	$AnimationPlayer.play("show_feedback_wrong")


func return_self() -> void:
	hide()
	$AnimationPlayer.stop()
	feedback_conveyed.emit(self)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	return_self()
