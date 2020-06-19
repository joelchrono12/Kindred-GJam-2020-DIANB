extends KinematicBody2D
var grav = 30
var motion = Vector2()
const FLOOR = Vector2(0,-1)
var direction_can_be_altered
var saved_motion
export var SPEED = 60
onready var anim= $AnimationPlayer
onready var originalpos=position.y

func _ready() -> void:
	anim.play("idle")
	set_physics_process(false)
	motion.x=SPEED
func _physics_process(delta: float) -> void:
		motion.y = move_and_slide(motion,FLOOR).y
		if is_on_wall():
			if direction_can_be_altered:
				motion.x*=-1
			else:
				set_physics_process(false)


func _on_LeftPress_body_entered(body):
	set_physics_process(true)
	anim.play("going_left")
	motion.x=SPEED*-1
	direction_can_be_altered=false

func _on_LeftPress_body_exited(body):
	set_physics_process(false)
	position.y=originalpos
	anim.play("idle")
	pass
func _on_RightPress_body_entered(body):
	anim.play("going_right")
	set_physics_process(true)
	motion.x=SPEED
	direction_can_be_altered=false
func _on_RightPress_body_exited(body):
	set_physics_process(false)
	position.y=originalpos
	anim.play("idle")
	pass
