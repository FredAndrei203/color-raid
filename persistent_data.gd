class_name PersistentData extends Node

var high_score: int = 0
var max_combo: int = 0


func save() -> Dictionary:
	var data_dict: Dictionary = {
		"high_score": high_score,
		"max_combo": max_combo
	}
	return data_dict

func load_data(data: Dictionary) -> void:
	for key in data.keys():
		if key in self:
			set(key, data[key])
