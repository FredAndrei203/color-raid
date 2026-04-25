class_name MainScene extends Node


func _process(_delta: float) -> void:
	var time_left: float = $Timer.time_left
	$HUD.display_time_left("%.2f" %time_left)


func start_game() -> void:
	$ColorLanes.show()
	$HUD.show()
	$MainMenuScreen.hide()
	$Controller.enabled = true
	$BlockContainer.initialize_lanes()
	$GameRule.start_level()


func game_ended() -> void:
	$BlockContainer.reset_container()
	$Controller.enabled = false
	$ColorLanes.reset_lanes()
	$ColorLanes.hide()
	$HUD.hide()
	$MainMenuScreen.show()
	if $GameRule.score > PersistentData.high_score:
		PersistentData.high_score = $GameRule.score
	$MainMenuScreen.display_score(str($GameRule.score))
	$MainMenuScreen.display_high_score(str(PersistentData.high_score))


func _on_game_rule_score_updated(score: int) -> void:
	$HUD.display_score(str(score))


func _on_game_rule_game_ended() -> void:
	game_ended()


func _on_main_menu_screen_game_started() -> void:
	start_game()
