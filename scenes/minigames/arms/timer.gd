extends Timer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var txt = round_to_dec(self.get_time_left(),2)
	$Label.set_text(str(txt))


func round_to_dec(num, digit):
	return round(num * pow(10.0, digit)) / pow(10.0, digit)


func _on_timeout():
	global.goto_scene("res://scenes/main.tscn")
