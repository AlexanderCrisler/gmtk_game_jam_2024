extends Control

@export var game_manager : GameManager

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	game_manager.connect("toggle_game_paused", _on_game_manager_toggle_game_paused)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_manager_toggle_game_paused(is_paused : bool):
	if(is_paused):
		show()
	else:
		hide()


func _on_continue_pressed() -> void:
	game_manager.game_paused = false


func _on_main_menu_pressed() -> void:
	game_manager.game_paused = false
	global.goto_scene("res://scenes/menus/start_screen.tscn")


func _on_exit_game_pressed() -> void:
	get_tree().quit()
