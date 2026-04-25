class_name FeedbackObject extends Marker2D

func _ready() -> void:
	$AnimationPlayer.play("RESET")

func display_feedback(feedback: String, positive: bool) -> void:
	$FeedbackLabel.text = feedback
	$AnimationPlayer.play("RESET")
	if positive:
		$AnimationPlayer.play("show_feedback_right")
	else:
		$AnimationPlayer.play("show_feedback_wrong")
