extends Node2D

@export var body_builder : Sprite2D
@export var indicator : Sprite2D
@export var increment_step : int = 5

var score = 0
var target_rot
var target_dir
var current_player_rot


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_rot = increment_step
	indicator.global_rotation_degrees = target_rot


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_player_rot = body_builder.global_rotation_degrees
	target_dir = 0 if target_rot < 0 else 1
	
	$Label.text = str(score)
	
	if current_player_rot >= 90 or current_player_rot <= -90:
		print(score)
		print("Game Over")
		global.increaseAbs(score)
		global.goto_scene("res://scenes/main.tscn")
	
	if target_dir == 0 and current_player_rot <= target_rot:
		score += 1
		target_rot = (target_rot * -1) + increment_step
		indicator.global_rotation_degrees = target_rot
	elif target_dir == 1 and current_player_rot >= target_rot:
		score += 1
		target_rot = (target_rot * -1)
		indicator.global_rotation_degrees = target_rot
