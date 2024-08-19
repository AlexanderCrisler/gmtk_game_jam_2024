extends Timer
var revealNumber = 0
var armsValue
var coreValue
var legsValue
var handsUp = preload("res://Assets/judge icon hands up.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#threshold of 200 combined to cap out legs
	legsValue = int((global.leftLeg+global.rightLeg)/24)
	if legsValue > 10:
		legsValue = 10
		
	#threshhold of 70 to cap out abs
	coreValue = int(global.abs/7)
	if coreValue>10:
		coreValue = 10
	
	armsValue = int(global.rightArm + global.leftArm)
	$"../Score1".text = str(armsValue)
	$"../Score2".text = str(coreValue)
	$"../Score3".text = str(legsValue)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timeout():
	if revealNumber == 0:
		$"../Score1".visible = true
		$"../JudgeIcon".texture = handsUp
	if revealNumber == 1:
		$"../Score2".visible = true
		$"../JudgeIcon2".texture = handsUp
	if revealNumber ==2:
		$"../Score3".visible = true
		$"../JudgeIcon3".texture = handsUp
	revealNumber +=1
