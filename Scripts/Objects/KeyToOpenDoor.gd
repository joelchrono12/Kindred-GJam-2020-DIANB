extends Area2D

onready var anim=$AnimationPlayer
func _ready():
	anim.play("idle")

func _on_KeyToOpenDoor_body_entered(body):
	anim.play("key_used")
