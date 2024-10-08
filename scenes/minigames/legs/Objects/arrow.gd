extends Node2D

@onready var offset = 180
var direction
var speed = 200
var mainScene
var moveBenefit = 0
var isLeft = false
# Called when the node enters the scene tree for the first time.
func _ready():
	
	if isLeft:
		moveBenefit = global.leftLeg*.5
	else:
		moveBenefit = global.rightLeg*.5
	speed = speed - moveBenefit
	direction = int(randf_range(-2,3))
	$Sprite2D.rotation_degrees = 90*direction
	if(direction == 1 or direction == -1):
		position = Vector2(position.x -direction*offset, position.y)
		$Sprite2D.flip_v = true
	if(direction == 2):
		position = Vector2(position.x, position.y -offset)
		$Sprite2D.flip_v = true
	if(direction == 0):
		position = Vector2(position.x, position.y +offset)
		$Sprite2D.flip_v = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(direction == 1 or direction == -1):
		position = Vector2(position.x + direction*speed*delta, position.y)
	if(direction == 2):
		position = Vector2(position.x, position.y +1*speed*delta)
	if(direction == 0):
		position = Vector2(position.x, position.y -1*speed*delta)

func _on_static_body_2d_area_entered(area):
	if area.is_in_group("Blocker"):
		queue_free()
		
	if area.is_in_group("Center"):
		queue_free()
