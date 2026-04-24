extends Node

func _ready() -> void:
	$GameRule.start_level()

func _process(delta: float) -> void:
	var time_left: float = $Timer.time_left
	$HUD.display_time_left("%.2f" %time_left)


func _on_game_rule_score_updated(score: int) -> void:
	$HUD.display_score(str(score))


func _on_game_rule_game_ended() -> void:
	$Controller.enabled = false
