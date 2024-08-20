extends Node2D
var forearmLeft 
var forearmRight
var repsLeft = 0
var repsRight = 0
var leftRep_key1
var leftRep_key2
var leftRep_key3
var rightRep_key1
var rightRep_key2
var rightRep_key3

# Called when the node enters the scene tree for the first time.
func _ready():
	forearmLeft = $"Player/Left forearm"
	forearmRight = $"Player/Right forearm"
	pass # Replace with function body.
	InputMap.add_action("leftRep")
	InputMap.add_action("rightRep")
	leftRep_key1 = InputEventKey.new()
	leftRep_key2 = InputEventKey.new()
	leftRep_key3 = InputEventKey.new()
	rightRep_key1 = InputEventKey.new()
	rightRep_key2 = InputEventKey.new()
	rightRep_key3 = InputEventKey.new()


func _process(delta):
	
	# everytime a frame is updates, process runs
	# anything done in process happens at the framerate
	if forearmLeft.global_rotation_degrees > -144 && forearmLeft.global_rotation_degrees < 20:
		if forearmLeft.global_rotation_degrees >= -144 && forearmLeft.global_rotation_degrees < -90:
			InputMap.action_erase_event("leftRep", leftRep_key2)
			InputMap.action_erase_event("leftRep", leftRep_key3)
			#KeyChange
			leftRep_key1.physical_keycode = KEY_T
			InputMap.action_add_event("leftRep", leftRep_key1)
		#LeftStage 2
		elif forearmLeft.global_rotation_degrees >= -90 && forearmLeft.global_rotation_degrees < -20:
			InputMap.action_erase_event("leftRep", leftRep_key1)
			InputMap.action_erase_event("leftRep", leftRep_key3)
			#KeyChange
			leftRep_key2.physical_keycode = KEY_Z
			InputMap.action_add_event("leftRep", leftRep_key2)
		#LeftStage 3
		elif (forearmLeft.global_rotation_degrees <= 20):
			InputMap.action_erase_event("leftRep", leftRep_key1)
			InputMap.action_erase_event("leftRep", leftRep_key2)
			#KeyChange
			leftRep_key3.physical_keycode = KEY_D
			InputMap.action_add_event("leftRep", leftRep_key3)
		#Fall Rate left
		#Make this a function of the number of reps so that it gets harder
		forearmLeft.global_rotation_degrees -= 15*delta
		
	elif forearmLeft.global_rotation_degrees > 20:
		repsLeft += 1
		forearmLeft.global_rotation_degrees = -144
		print("RepsLeft", repsLeft)
		
###############**********RIGHT************##################
	if forearmRight.global_rotation_degrees < 147 && forearmRight.global_rotation_degrees >= -17:
		if forearmRight.global_rotation_degrees <= 147 && forearmRight.global_rotation_degrees >= 80:
			InputMap.action_erase_event("rightRep", rightRep_key2)
			InputMap.action_erase_event("rightRep", rightRep_key3)
			#KeyChange
			rightRep_key1.physical_keycode = KEY_U
			InputMap.action_add_event("rightRep", rightRep_key1)
		#RightStage 2
		elif forearmRight.global_rotation_degrees < 80 && forearmRight.global_rotation_degrees >= 20 :
			InputMap.action_erase_event("rightRep", rightRep_key1)
			InputMap.action_erase_event("rightRep", rightRep_key3)
			#KeyChange
			rightRep_key2.physical_keycode = KEY_M
			InputMap.action_add_event("rightRep", rightRep_key2)
		##RightStage 3
		elif (forearmRight.global_rotation_degrees < 20):
			InputMap.action_erase_event("rightRep", rightRep_key1)
			InputMap.action_erase_event("rightRep", rightRep_key2)
			#KeyChange
			rightRep_key3.physical_keycode = KEY_K
			InputMap.action_add_event("rightRep", rightRep_key3)
			
		#Fall Rate right 
		#Make this a function of the number of reps so that it gets harder
		forearmRight.global_rotation_degrees += 15*delta
		
		
	elif forearmRight.global_rotation_degrees < -17:
		repsRight += 1
		forearmRight.global_rotation_degrees = 147

func exitArms(): 
	if Input.is_key_pressed(KEY_W):
		
		global.goto_scene("res://scenes/main.tscn")

func _input(ev):	
	if Input.is_action_just_pressed("leftRep"):
		forearmLeft.global_rotation_degrees += 8
		
	if Input.is_action_just_pressed("rightRep"):
		forearmRight.global_rotation_degrees -= 8
