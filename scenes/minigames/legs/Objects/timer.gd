extends Timer

var arrow = preload("res://scenes/minigames/legs/Objects/Arrow.tscn")
var speedIncrease = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	


func _on_timeout():
	var arr = arrow.instantiate()
	arr.position = $"..".position
	add_child(arr)
	wait_time = randf_range(.75-speedIncrease,1-speedIncrease);
	if speedIncrease<.65:
		speedIncrease += .02
