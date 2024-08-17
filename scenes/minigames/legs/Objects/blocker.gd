extends Node2D

@export var leftSide = true
var startPos
var offset = 50
var leftPos
var rightPos
var upPos
var downPos
var mainScene
# Called when the node enters the scene tree for the first time.
func _ready():
	mainScene = $".."
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
	if leftSide:
		if Input.is_key_pressed(KEY_A):
			set_position(leftPos)
			$Area2D.rotation_degrees = 90
			
		if Input.is_key_pressed(KEY_W):
			set_position(upPos)
			$Area2D.rotation_degrees = 0
		
		if Input.is_key_pressed(KEY_D):
			set_position(rightPos)
			$Area2D.rotation_degrees = -90
			
		if Input.is_key_pressed(KEY_S):
			set_position(downPos)
			$Area2D.rotation_degrees = 180
			
	else:
		if Input.is_key_pressed(KEY_LEFT):
			set_position(leftPos)
			$Area2D.rotation_degrees = 90
			
		if Input.is_key_pressed(KEY_UP):
			set_position(upPos)
			$Area2D.rotation_degrees = 0
		
		if Input.is_key_pressed(KEY_RIGHT):
			set_position(rightPos)
			$Area2D.rotation_degrees = -90
			
		if Input.is_key_pressed(KEY_DOWN):
			set_position(downPos)
			$Area2D.rotation_degrees = 180
		
		

func _on_area_2d_area_entered(area):
	$"..".incrementBlocks()
