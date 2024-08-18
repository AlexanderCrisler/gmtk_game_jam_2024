extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _input(ev):
	if Input.is_key_pressed(KEY_W):
		global.goto_scene("res://scenes/main.tscn")
