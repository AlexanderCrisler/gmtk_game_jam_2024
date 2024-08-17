extends Node2D

var mainScene
@export var left = true;
# Called when the node enters the scene tree for the first time.
func _ready():
	mainScene = $".."


func _on_area_2d_area_entered(area):
	if left:
		mainScene.destroyLeft()
	else:
		mainScene.destroyRight()
