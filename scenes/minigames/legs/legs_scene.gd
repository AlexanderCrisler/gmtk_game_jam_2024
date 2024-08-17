extends Node2D

var hits = 0
var blocks = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func incrementHits():
	hits+=1
	print(hits)
func incrementBlocks():
	blocks +=1
	print(blocks)
