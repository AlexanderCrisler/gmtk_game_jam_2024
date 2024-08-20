extends Node

var lowerThreshold = 3
var upperThreshold = 7
# Called when the node enters the scene tree for the first time.
func _ready():
	var rightArmValue = (int(global.rightArm)*2)
	
	var leftArmValue = (int(global.leftArm)*2)
	
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
