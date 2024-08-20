extends AnimatedSprite2D
var repLevel = 0
var repFailed = false
var repComplete = false

func _process(delta):
	%repcompletebar.set_value(repLevel)

func _rep_failure_timeout():
	if repLevel > 0:
		repLevel -= 1
		print(repLevel)
	elif repLevel == 0:
			repFailed = true
	elif repLevel == 100:
			repComplete = true

func _input(event: InputEvent) -> void:
	#if pullBar == true:
		if Input.is_action_just_pressed("progressRep") :
			repLevel += 1
			print(repLevel)
			await get_tree().create_timer(3.0).timeout
