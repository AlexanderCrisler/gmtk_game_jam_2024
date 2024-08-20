extends Node

var lowerThreshold = 3
var upperThreshold = 7


#@export var rotation_point = Vector2(550, 500)
@export var rotation_around_point = 0
@export var rate_of_rotation : float = .25
@export var input_speed : float = 1

var lean = 0
var acceleration : float = 1
var timer = 0
var rotating_parts : Array


# Called when the node enters the scene tree for the first time.
func _ready():
	var rightArmValue = (int(global.rightArm))
	
	var leftArmValue = (int(global.leftArm))
	
	var leftLegValue
	leftLegValue = int((global.leftLeg)/10)
	
	var rightLegValue
	rightLegValue = int((global.rightLeg)/10)

		
	var coreValue
	coreValue = int(global.abs/7)
	if coreValue>10:
		coreValue = 10
		
	if leftLegValue > lowerThreshold:
		$"Left Leg".hide()
		$"Player mid/Left Leg".show()
	if leftLegValue >= upperThreshold:
		$"Player mid/Left Leg".hide()
		$"Player Buff/Left Leg".show()
	
	if rightLegValue > lowerThreshold:
		$"Right Leg".hide()
		$"Player mid/Right Leg".show()
	if rightLegValue >= upperThreshold:
		$"Player mid/Right Leg".hide()
		$"Player Buff/Right Leg".show()
	
	if coreValue > lowerThreshold:
		$Chest.hide()
		$"Player mid/Chest".show()
	if coreValue >= upperThreshold:
		$"Player mid/Chest".hide()
		$"Player Buff/Chest".show()
	
	if leftArmValue > lowerThreshold:
		$"Left forearm".hide()
		$"Left Bicep".hide()
		$"Player mid/Left Bicep".show()
		$"Player mid/Left forearm".show()
	if leftArmValue >=upperThreshold:
		$"Player mid/Left Bicep".hide() 
		$"Player mid/Left forearm".hide()
		$"Player Buff/Left Bicep".show()
		$"Player Buff/Left forearm".show()
		
	if rightArmValue > lowerThreshold:
		$"Right Bicep".hide()
		$"Right forearm".hide()
		$"Player mid/Right Bicep".show()
		$"Player mid/Right forearm".show()
	if rightArmValue >=upperThreshold:
		$"Player mid/Right Bicep".hide()
		$"Player mid/Right forearm".hide()
		$"Player Buff/Right Bicep".show()
		$"Player Buff/Right forearm".show()
	
	rotating_parts.append($Face)
	rotating_parts.append($Chest)
	rotating_parts.append($"Left Bicep")
	rotating_parts.append($"Left forearm")
	rotating_parts.append($"Right Bicep")
	rotating_parts.append($"Right forearm")
	
	rotating_parts.append($"Player mid/Chest")
	rotating_parts.append($"Player mid/Left Bicep")
	rotating_parts.append($"Player mid/Left forearm")
	rotating_parts.append($"Player mid/Right Bicep")
	rotating_parts.append($"Player mid/Right forearm")
	
	rotating_parts.append($"Player Buff/Chest")
	rotating_parts.append($"Player Buff/Left Bicep")
	rotating_parts.append($"Player Buff/Left forearm")
	rotating_parts.append($"Player Buff/Right Bicep")
	rotating_parts.append($"Player Buff/Right forearm")
	
	
	
	lean = randi_range(0,1)
	if lean == 0:
		rotation_around_point = -1
	else:
		rotation_around_point = 0

func _physics_process(delta: float) -> void:
	if rad_to_deg($Chest.global_rotation) < -90 or rad_to_deg($Chest.global_rotation) > 90:
		return
		
	if Input.is_action_pressed("ui_left"):
		if rotation_around_point >= 0:
			acceleration = 1
		rate_of_rotation = -1 * input_speed * acceleration
	elif Input.is_action_pressed("ui_right"):
		if rotation_around_point < 0:
			acceleration = 1
		rate_of_rotation = input_speed * acceleration
	else:
		if rotation_around_point < 0:
			rate_of_rotation = -.25 * acceleration
		else:
			rate_of_rotation = .25 * acceleration

	rotation_around_point += rate_of_rotation
	acceleration += acceleration * delta * timer
	if global.abs > 5:
		timer += delta / (global.abs/5)
		pass
		
	else:
		timer += delta
	
	for part in rotating_parts:
		part.global_rotation = deg_to_rad(rotation_around_point)
