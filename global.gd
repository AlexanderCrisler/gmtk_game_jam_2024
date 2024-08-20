extends Node

var leftLeg = 0 
var rightLeg = 0
var abs = 0
var leftArm = 0
var rightArm = 0
var current_scene = null
var current_round = 1
var legsDone = false
var coreDone = false
var armsDone = false


func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)


func increaseLegs(left, right):
	leftLeg += left
	rightLeg += right
	print("left ",leftLeg)
	print("right ", rightLeg)


func increaseAbs(score):
	abs += score

func increaseArms(left, right):
	rightArm += right
	leftArm += left

func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	# It is now safe to remove the current scene.
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene
