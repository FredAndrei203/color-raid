class_name HUD extends Control

signal game_started

func display_time_left(time_left: String) -> void:
	$TimerLabel.text = time_left

func display_score(score: String) -> void:
	$ScoreLabel.text = score


func _on_play_button_pressed() -> void:
	$MainMenuScreen.hide()
	game_started.emit()
