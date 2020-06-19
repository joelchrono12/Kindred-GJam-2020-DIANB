extends "res://src/PlayerControl.gd"
var player_has_moved
var can_move
func _ready():
	can_move=false
	$NoMovementAllowed.start()
	player_has_moved=false
func _physics_process(delta):
	if selected_player==get_parent().character_num:
		check_movement()
		if can_move:
			handle_input_motion()
			face_dir($Sprite)
			#assign_anim()
		$PlayerCam.current=true
	elif (selected_player <= get_parent().character_num or selected_player==get_parent().player_quantity-1) and player_has_moved: #or get_parent().player_quantity==0:
		dead()
	#Selection animation and stuff that happens when the player doesnt move
	if !player_has_moved and selected_player==get_parent().character_num:
		$AnimationPlayer.play("selected")
	else:
		assign_anim()
	
func check_movement():
	if motion.x!=0:
		player_has_moved=true

func _on_NoMovementAllowed_timeout():
	can_move=true
	pass # Replace with function body.
func assign_anim():
	if can_move:
		if !is_grounded:
			if motion.y<0:
				pass#print("is jumping")
			elif motion.y>0: 
				pass#print("is falling")
		elif motion.x!=0 and is_grounded:
			$AnimationPlayer.play("run")
		else:
			$AnimationPlayer.play("idle")
func dead():
	can_move=false
	motion.x=0
	$AnimationPlayer.play("dead")
	yield(get_tree().create_timer(1),"timeout")
	queue_free()
