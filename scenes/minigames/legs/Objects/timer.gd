extends Timer

var arrow = preload("res://scenes/minigames/legs/Objects/Arrow.tscn")
var speedIncrease = 0
var benefits = 0
var isLeft
# Called when the node enters the scene tree for the first time.
func _ready():
	isLeft = $"..".isLeft
	
func _on_timeout():
	var arr = arrow.instantiate()
	arr.position = $"..".position
	arr.isLeft = isLeft
	add_child(arr)
	wait_time = randf_range(.75-speedIncrease,1-speedIncrease);
	if speedIncrease<.65:
		speedIncrease += .02
