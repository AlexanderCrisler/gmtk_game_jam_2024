extends Node2D

@export var wait_time : float = 4

var time_elapsed = 0
var labels : Array = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	labels.append($CenterContainer/VBoxContainer/Label)
	labels.append($CenterContainer/VBoxContainer/Label2)
	labels.append($CenterContainer/VBoxContainer/Label3)
	labels.append($CenterContainer/VBoxContainer/Label4)
	labels.append($CenterContainer/VBoxContainer/Label5)
	
	for label in labels:
		label.hide()

func _input(ev):
	if Input.is_anything_pressed():
		time_elapsed +=4-int(time_elapsed)%4
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	time_elapsed += delta
	
	if time_elapsed <= 0:
		return
	
	if (int(time_elapsed)/wait_time) < labels.size():
		labels[int(time_elapsed)/wait_time].show()
	elif (int(time_elapsed)/wait_time) < labels.size() + 1:
		pass
	else:
		global.goto_scene("res://scenes/main.tscn")
	
	print(time_elapsed)
	pass
	
