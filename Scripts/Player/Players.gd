extends Node2D
var motion = Vector2()
var FLOOR = Vector2(0,-1)
#export var GRAVITY = 20
#export var SPEED = 50
#export var JUMP_FORCE = -100
var direction
var character_num
var player_quantity
func _ready():
	player_quantity=get_child_count()
	character_num=0
	set_physics_process(true)
	pass
func _physics_process(delta):
	restart_scene()
	back_to_menu()
	if Input.is_action_just_pressed("switch_player"):
		switch_player()
func restart_scene():
	var restart=Input.is_action_just_pressed("restart")
	if restart:
		get_tree().reload_current_scene()	
func back_to_menu():
	var quit=Input.is_action_just_pressed("ui_cancel")
	if quit:
		get_tree().change_scene("res://Control.tscn")
func switch_player():
	character_num+=1
	if character_num==player_quantity:
		print("No more players available")
		character_num=0
