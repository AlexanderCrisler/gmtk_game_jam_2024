extends Sprite2D

@export var rotation_point = Vector2(550, 500)
@export var rotation_around_point = 0
@export var rate_of_rotation : float = .25
@export var input_speed : float = 1

var lean = 0
var acceleration : float = 1
var timer = 0


func _ready() -> void:
	global_position = rotation_point
	lean = randi_range(0,1)
	if lean == 0:
		rotation_around_point = -1
	else:
		rotation_around_point = 0


func _physics_process(delta: float) -> void:
	if rad_to_deg(global_rotation) < -90 or rad_to_deg(global_rotation) > 90:
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
	if global.abs > 0:
		timer += delta / (global.abs/5)
	else:
		timer += delta
	
	global_rotation = deg_to_rad(rotation_around_point)
