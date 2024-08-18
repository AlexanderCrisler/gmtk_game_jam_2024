extends Node2D

var left = 0
var right = 0
var leftDestroyed = false
var rightDestroyed = false
var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func destroyLeft():
	$Blocker.queue_free()
	$Spawner.queue_free()
	$Center.queue_free()
	leftDestroyed = true
	if rightDestroyed:
		gameOver()
	
func destroyRight():
	$Spawner2.queue_free()
	$Blocker2.queue_free()
	$Center2.queue_free()
	rightDestroyed = true
	if leftDestroyed:
		gameOver()
		
func incrementLeft():
	left +=1
	addScore()
	
func incrementRight():
	right +=1
	addScore()
	
func gameOver():
	print("game over")
	global.increaseLegs(left,right)
	global.goto_scene("res://scenes/main.tscn")

func addScore():
	score +=1
	$Label.text = str(score)
	
	
