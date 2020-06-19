extends KinematicBody2D


var motion = Vector2()
var FLOOR = Vector2(0,-1)
export var GRAVITY = 19
export var SPEED = 220
export (int, 0, 200) var push_speed = 20
export var JUMP_FORCE = -500
var direction
var coyoteJump=true

var jump_was_pressed=false
var is_grounded=true
export (int) var selected_player
func _ready():
	pass
func _physics_process(delta):
	motion.y+=GRAVITY
	motion=move_and_slide(motion,FLOOR,false,4,PI/4,false)
	check_if_grounded()
func handle_input_motion():
	var right=Input.get_action_strength("ui_right")
	var left=Input.get_action_strength("ui_left")
	var jump=Input.is_action_just_pressed("ui_up")
	direction=-left+right
	motion.x=SPEED*direction
	if is_grounded==true:
			coyoteJump=true
			if jump_was_pressed==true:
				motion.y= JUMP_FORCE
				
	if jump:
		jump_was_pressed=true
		remember_jump_time()
		if coyoteJump==true:
			jump()
	if is_grounded==false:
		coyoteTime()
		motion.x=lerp(motion.x,direction*SPEED,0.2)
func face_dir(target):
	if direction>0:
		target.flip_h=false
	elif direction<0:
		target.flip_h=true
func jump():
	motion.y= JUMP_FORCE
	is_grounded=false
func assign_anim():
	if !is_grounded:
		if motion.y<0:
			pass#print("is jumping")
		elif motion.y>0: 
			pass#print("is falling")
	elif motion.x!=0 and is_grounded:
		pass#$AnimationPlayer.play("run")
	else:
		pass#print("idle")
func coyoteTime():
	yield(get_tree().create_timer(.05),"timeout")
	coyoteJump=false
func remember_jump_time():
	yield(get_tree().create_timer(.1),"timeout")
	jump_was_pressed=false
func check_if_grounded():
	if is_on_floor():
		is_grounded=true
	else:
		is_grounded=false
	return is_grounded
