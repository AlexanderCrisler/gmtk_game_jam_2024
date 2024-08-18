extends Node2D

class_name GameManager

signal toggle_game_paused(is_paused : bool)

var game_paused : bool = false:
	get:
		return game_paused
	set(value):
		game_paused = value
		get_tree().paused = game_paused
		emit_signal("toggle_game_paused", game_paused)

func _input(event : InputEvent):
	if(event.is_action_pressed("ui_cancel")):
		game_paused = !game_paused
		

func _ready() -> void:
	print("ready ran")
	if global.armsDone and global.legsDone and global.coreDone:
		global.armsDone = false
		global.legsDone = false
		global.coreDone = false
		global.current_round +=1
		#This is where we would run whatever happens between rounds 



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_arms_pressed():
	if !global.armsDone:
		global.armsDone = true
	


func _on_core_pressed():
	if !global.coreDone:
		global.coreDone = true


func _on_legs_pressed():
	if !global.legsDone:
		global.legsDone = true
		global.goto_scene("res://scenes/minigames/legs/legs_scene.tscn")
