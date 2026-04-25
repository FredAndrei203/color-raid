class_name PersistentData extends Node

var high_score: int = 0

func save() -> Dictionary:
	return { "high_score": high_score } # Keep it simple
