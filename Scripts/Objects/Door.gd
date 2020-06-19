extends KinematicBody2D
onready var anim=$AnimationPlayer
var is_opened=false
func _ready():
	anim.play("closed_door")
func _physics_process(delta):
	pass
		
func _on_KeyToOpenDoor_body_entered(body):
	anim.play("open_door")
	
	
