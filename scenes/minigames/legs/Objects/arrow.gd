extends Node2D

var direction = 1
var offset = 180
# Called when the node enters the scene tree for the first time.
func _ready():
	direction = int(randf_range(-2,3))
	$Sprite2D.rotation_degrees = 90*direction
	if(direction == 1 or direction == -1):
		position = Vector2(position.x -direction*offset, position.y)
	if(direction == 2):
		position = Vector2(position.x, position.y -offset)
	if(direction == 0):
		position = Vector2(position.x, position.y +offset)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(direction == 1 or direction == -1):
		position = Vector2(position.x + direction, position.y)
	if(direction == 2):
		position = Vector2(position.x, position.y +1)
	if(direction == 0):
		position = Vector2(position.x, position.y -1)
