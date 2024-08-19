extends Timer
var revealNumber = 0
var armsValue
var coreValue
var legsValue
var handsUp = preload("res://Assets/judge icon hands up.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicPlayer.fadeOut()
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
	self.wait_time = 2

	
	if revealNumber == 0:
		$"../Score1".visible = true
		$"../JudgeIcon".texture = handsUp
		applaud(armsValue)
	if revealNumber == 1:
		$"../Score2".visible = true
		$"../JudgeIcon2".texture = handsUp
		applaud(coreValue)
	if revealNumber ==2:
		$"../Score3".visible = true
		$"../JudgeIcon3".texture = handsUp
		applaud(legsValue)
	revealNumber +=1
	self.start()
	
func applaud(score):
	if score == 10:
		$"../AudioStreamPlayer2D".stream = load("res://Music/Cheering - Made with Clipchamp.mp3")
		$"../AudioStreamPlayer2D".play()
	elif score <4:
		$"../AudioStreamPlayer2D".stream = load("res://Music/Aww Effect.mp3")
		$"../AudioStreamPlayer2D".play()
	else:
		$"../AudioStreamPlayer2D".stream = load("res://Music/Clapping - Made with Clipchamp.mp3")
		$"../AudioStreamPlayer2D".play()
