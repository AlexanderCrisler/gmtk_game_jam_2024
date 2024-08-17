extends Node2D

var left = 0
var right = 0
var leftDestroyed = false
var rightDestroyed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func destroyLeft():
	$Blocker.queue_free()
	$Spawner.queue_free()
	$Center.queue_free()
	leftDestroyed = true
	if rightDestroyed:
		print("game over")
	#print(hits)
func destroyRight():
	$Spawner2.queue_free()
	$Blocker2.queue_free()
	$Center2.queue_free()
	rightDestroyed = true
	if leftDestroyed:
		print("game over")
func incrementLeft():
	left +=1
func incrementRight():
	right +=1
