extends Node2D

var player_scene = preload("res://scenes/player/player.tscn")

func _ready():
	spawn_player()

func spawn_player(): 
	var player = player_scene.instantiate()

	add_child(player)

	if has_node("player_spawner"):
		player.global_position = $player_spawner.global_position

func _on_exit_door_body_entered(_body: Node2D) -> void:
	Gamemanager.load_next_level()
