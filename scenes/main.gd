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

	
		
	if global.armsDone and global.legsDone and global.coreDone:
		global.armsDone = false
		global.legsDone = false
		global.coreDone = false
		global.current_round +=1
		#This is where we would run whatever happens between rounds 
	updateUI()
	if global.current_round > 3:
		global.goto_scene("res://scenes/Finale/Finale.tscn")
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func updateUI():
	
	$"Text/Week/Week number".text = str(global.current_round)
	$"Text/Arm Right/Arm Right Number".text = str(global.rightArm)
	$"Text/Arm Left/Arm Left Number".text = str(global.leftArm)
	$"Text/Core/Core Number".text = str(global.abs)
	$"Text/Leg Right/Leg Right Number".text = str(global.rightLeg)
	$"Text/Leg Left/Leg Left Number".text = str(global.leftLeg)
	
	if global.armsDone:
		$VBoxContainer/Arms.disabled = true
	if global.coreDone:
		$VBoxContainer/Core.disabled = true
	if global.legsDone:
		$VBoxContainer/Legs.disabled = true

func _on_arms_pressed():
	if !global.armsDone:
		global.armsDone = true
		global.goto_scene("res://scenes/minigames/arms/arms.tscn")
	


func _on_core_pressed():
	if !global.coreDone:
		global.coreDone = true
		global.goto_scene("res://scenes/minigames/core/balance.tscn")
	


func _on_legs_pressed():
	if !global.legsDone:
		global.legsDone = true
		global.goto_scene("res://scenes/minigames/legs/legs_scene.tscn")
