class_name HUD extends Control


func display_time_left(time_left: String) -> void:
	%TimerLabel.text = time_left


func display_score(score: String) -> void:
	%ScoreLabel.text = score


func show_positive_feedback() -> void:
	$FeedbackManager.show_positive_feedback()


func show_negative_feedback() -> void:
	$FeedbackManager.show_negative_feedback()
