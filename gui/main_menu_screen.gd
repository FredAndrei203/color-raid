class_name MainMenuScreen extends Control

signal game_started


func display_score(score: String) -> void:
	%GameOverCont.show()
	%LastScoreLabel.text = "Score: " + score


func display_high_score(high_score: String) -> void:
	%HighscoreLabel.text = "Highscore: " + high_score


func _on_play_button_pressed() -> void:
	game_started.emit()


func _on_tutorial_button_pressed() -> void:
	$TutorialTexture.show()


func _on_tutorial_texture_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			$TutorialTexture.hide()
