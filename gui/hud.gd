class_name HUD extends Control


func display_time_left(time_left: String) -> void:
	%TimerLabel.text = time_left


func display_score(score: String) -> void:
	%ScoreLabel.text = score
