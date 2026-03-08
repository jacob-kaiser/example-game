extends Node

var current_level_num: int = 1

func load_next_level():
	current_level_num += 1
	

	var next_scene_path: String

	match current_level_num:
		2:
			next_scene_path = "res://scenes/levels/level_two.tscn"
		3:
			next_scene_path = "res://scenes/levels/level_three.tscn"
		4:
			next_scene_path = "res://scenes/levels/level_four.tscn"
		5:
			next_scene_path = "res://scenes/levels/level_five.tscn"
		_:
			next_scene_path = "res://levels/MainMenu.tscn"
			current_level_num = 1 
			
	get_tree().call_deferred("change_scene_to_file", next_scene_path)
