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
	
	InputMap.add_action("leftRep")
	InputMap.add_action("rightRep")
	leftRep_key1 = InputEventKey.new()
	leftRep_key2 = InputEventKey.new()
	leftRep_key3 = InputEventKey.new()
	rightRep_key1 = InputEventKey.new()
	rightRep_key2 = InputEventKey.new()
	rightRep_key3 = InputEventKey.new()


func _process(delta):
	if $"Player/Player mid/Left forearm".is_visible_in_tree():
		forearmLeft = $"Player/Player mid/Left forearm"
	elif $"Player/Player Buff/Left forearm".is_visible_in_tree():
		forearmLeft = $"Player/Player Buff/Left forearm"
		
	if $"Player/Player mid/Right forearm".is_visible_in_tree():
		forearmRight = $"Player/Player mid/Right forearm"
	elif $"Player/Player Buff/Right forearm".is_visible_in_tree():
		forearmRight = $"Player/Player Buff/Right forearm"
	
	# everytime a frame is updates, process runs
	# anything done in process happens at the framerate
	if forearmLeft.global_rotation_degrees > -144 && forearmLeft.global_rotation_degrees < 20:
		if forearmLeft.global_rotation_degrees >= -144 && forearmLeft.global_rotation_degrees < -90:
			InputMap.action_erase_event("leftRep", leftRep_key2)
			InputMap.action_erase_event("leftRep", leftRep_key3)
			#KeyChange
			leftRep_key1.physical_keycode = KEY_T
			$Left/Key_T.show()
			$Left/Key_Z.hide()
			$Left/Key_D.hide()
			InputMap.action_add_event("leftRep", leftRep_key1)
		#LeftStage 2
		elif forearmLeft.global_rotation_degrees >= -90 && forearmLeft.global_rotation_degrees < -20:
			InputMap.action_erase_event("leftRep", leftRep_key1)
			InputMap.action_erase_event("leftRep", leftRep_key3)
			#KeyChange
			leftRep_key2.physical_keycode = KEY_Z
			$Left/Key_T.hide()
			$Left/Key_Z.show()
			$Left/Key_D.hide()
			InputMap.action_add_event("leftRep", leftRep_key2)
		#LeftStage 3
		elif (forearmLeft.global_rotation_degrees <= 20):
			InputMap.action_erase_event("leftRep", leftRep_key1)
			InputMap.action_erase_event("leftRep", leftRep_key2)
			#KeyChange
			leftRep_key3.physical_keycode = KEY_D
			$Left/Key_T.hide()
			$Left/Key_Z.hide()
			$Left/Key_D.show()
			InputMap.action_add_event("leftRep", leftRep_key3)
		#Fall Rate left
		#Make this a function of the number of reps so that it gets harder
		forearmLeft.global_rotation_degrees -= 15*delta
		
	elif forearmLeft.global_rotation_degrees > 20:
		repsLeft += 1
		$Label_Left.text = str(repsLeft)
		forearmLeft.global_rotation_degrees = -144
		print("RepsLeft", repsLeft)
		
###############**********RIGHT************##################
	if forearmRight.global_rotation_degrees < 147 && forearmRight.global_rotation_degrees >= -17:
		if forearmRight.global_rotation_degrees <= 147 && forearmRight.global_rotation_degrees >= 80:
			InputMap.action_erase_event("rightRep", rightRep_key2)
			InputMap.action_erase_event("rightRep", rightRep_key3)
			#KeyChange
			rightRep_key1.physical_keycode = KEY_U
			$Right/Key_U.show()
			$Right/Key_M.hide()
			$Right/Key_K.hide()
			InputMap.action_add_event("rightRep", rightRep_key1)
		#RightStage 2
		elif forearmRight.global_rotation_degrees < 80 && forearmRight.global_rotation_degrees >= 20 :
			InputMap.action_erase_event("rightRep", rightRep_key1)
			InputMap.action_erase_event("rightRep", rightRep_key3)
			#KeyChange
			rightRep_key2.physical_keycode = KEY_M
			$Right/Key_U.hide()
			$Right/Key_M.show()
			$Right/Key_K.hide()
			InputMap.action_add_event("rightRep", rightRep_key2)
		##RightStage 3
		elif (forearmRight.global_rotation_degrees < 20):
			InputMap.action_erase_event("rightRep", rightRep_key1)
			InputMap.action_erase_event("rightRep", rightRep_key2)
			#KeyChange
			rightRep_key3.physical_keycode = KEY_K
			$Right/Key_U.hide()
			$Right/Key_M.hide()
			$Right/Key_K.show()
			InputMap.action_add_event("rightRep", rightRep_key3)
			
		#Fall Rate right 
		#Make this a function of the number of reps so that it gets harder
		forearmRight.global_rotation_degrees += 15*delta
		
		
	elif forearmRight.global_rotation_degrees < -17:
		repsRight += 1
		$Label_Right.text = str(repsRight)
		forearmRight.global_rotation_degrees = 147

func exitArms(): 
	if Input.is_key_pressed(KEY_W):
		
		global.goto_scene("res://scenes/main.tscn")

func _input(ev):	
	if Input.is_action_just_pressed("leftRep"):
		forearmLeft.global_rotation_degrees += 8
		
	if Input.is_action_just_pressed("rightRep"):
		forearmRight.global_rotation_degrees -= 8


func _on_timer_timeout() -> void:
	global.rightArm += repsRight
	global.leftArm += repsLeft
	global.goto_scene("res://scenes/main.tscn")
	$Left/Key_Z.hide()
	$Left/Key_T.show()
	$Left/Key_D.hide()
	$Right/Key_U.show()
	$Right/Key_M.hide()
	$Right/Key_K.hide()
