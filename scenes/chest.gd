extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = create_tween()
	var buff = load("res://Assets/Character/Mid/medium_body.png")
	tween.tween_property(self,"texture",buff, 2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
