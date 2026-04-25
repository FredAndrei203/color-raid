class_name MainScene extends Node

func _ready() -> void:
	if not FileAccess.file_exists("user://savegame.save"):
		print("NO SAVE FILE EXISTS")
		return
	
	var save_file = FileAccess.open("user://savegame.save", FileAccess.READ)
	var json_string = save_file.get_line()
	var json = JSON.new()
	
	if json.parse(json_string) == OK:
		var data = json.data
		$PersistentData.high_score = data["high_score"]
		$MainMenuScreen.display_high_score(str(data["high_score"]))
	else:
		print("ERROR PARSING JSON")


func _process(_delta: float) -> void:
	var time_left: float = $Timer.time_left
	$HUD.display_time_left("%.2f" %time_left)


func start_game() -> void:
	$ColorLanes.show()
	$HUD.show()
	$MainMenuScreen.hide()
	$Controller.enabled = true
	$GameRule.start_level()


func game_ended() -> void:
	$Controller.enabled = false
	$ColorLanes.reset_lanes()
	$ColorLanes.hide()
	$HUD.hide()
	$MainMenuScreen.show()
	
	# Set new highscore
	if $GameRule.score > $PersistentData.high_score:
		$PersistentData.high_score = $GameRule.score
	
	#Show score and highscore
	$MainMenuScreen.display_score(str($GameRule.score))
	$MainMenuScreen.display_high_score(str($PersistentData.high_score))
	
	# Save persistent data
	save_game()

func save_game() -> void:
	var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var node_data = $PersistentData.save()
	save_file.store_line(JSON.stringify(node_data))

func _on_game_rule_score_updated(score: int) -> void:
	$HUD.display_score(str(score))


func _on_game_rule_game_ended() -> void:
	game_ended()


func _on_main_menu_screen_game_started() -> void:
	start_game()


func _on_game_rule_player_was_correct(correct: bool) -> void:
	$HUD.show_feedback(correct)
