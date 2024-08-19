extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func pause():
	$"Rhythm-upbeat-drive-rock-178420".stream_paused = true
	
func unpause():
	$"Rhythm-upbeat-drive-rock-178420".stream_paused = false
	
func fadeOut():
	$Timer.start()


func _on_timer_timeout():
	$"Rhythm-upbeat-drive-rock-178420".volume_db -=1
