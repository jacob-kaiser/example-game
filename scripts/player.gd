extends CharacterBody2D

@export var speed: float = 300.0
@onready var tilemap = get_node("../../TileMapLayer")
@onready var spawn = get_node("../../player_spawner")


func respawn():
	if spawn:
		global_position = spawn.global_position
	
func _physics_process(_delta):
	var direction = Vector2.ZERO

	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	direction = direction.normalized()
	velocity = direction * speed
	
	
	var player_tile_pos = tilemap.local_to_map(tilemap.to_local(global_position))
	var data = tilemap.get_cell_tile_data(player_tile_pos)
	
	if data:
		var should_die = data.get_custom_data("is_deadly")
		if should_die:
			respawn()
	
	move_and_slide()
