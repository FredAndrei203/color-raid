extends Node

func _process(delta: float) -> void:
	var time_left: float = $Timer.time_left
	$HUD.display_time_left("%.2f" %time_left)


func start_game() -> void:
	$Controller.enabled = true
	$GameRule.start_level()

func _on_game_rule_score_updated(score: int) -> void:
	$HUD.display_score(str(score))


func _on_game_rule_game_ended() -> void:
	$Controller.enabled = false


func _on_hud_game_started() -> void:
	start_game()
