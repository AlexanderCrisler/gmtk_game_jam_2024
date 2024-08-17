extends AnimatableBody2D
var startPos
var offset = 50
var leftPos
var rightPos
var upPos
var downPos
# Called when the node enters the scene tree for the first time.
func _ready():
	startPos = global_position
	leftPos = startPos + Vector2(-offset,0)
	rightPos = startPos + Vector2(offset,0)
	upPos= startPos + Vector2(0,-offset)
	downPos= startPos + Vector2(0,offset)
	set_position(upPos)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(ev):
	if Input.is_key_pressed(KEY_A):
		
		set_position(leftPos)
		#$Blocker.rotation_degrees = 90
		
		
		
	if Input.is_key_pressed(KEY_W):
		
		set_position(upPos)
		#$Blocker.rotation_degrees = 0
		
	if Input.is_key_pressed(KEY_D):
		
		set_position(rightPos)
		#$Blocker.rotation_degrees = -90
		
	if Input.is_key_pressed(KEY_S):
		
		set_position(downPos)
		#$Blocker.rotation_degrees = 180
	
