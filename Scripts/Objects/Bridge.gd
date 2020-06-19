extends Node2D

export (bool) var trigger_activated = false
var can_be_triggered
func _ready():
	$BridgeTrigger/Sprite/AnimationPlayer.play("hide")
	$RigidBody2D.mode=RigidBody2D.MODE_STATIC
func _physics_process(delta):
	if can_be_triggered:
		if Input.is_action_just_pressed("trigger_button"):
			$BridgeTrigger/CollisionShape2D.queue_free()
			$AnimationPlayer.play("FlipSwitch")
			yield(get_tree().create_timer(0.6),"timeout")
			trigger_activated=true
			$StaticTimer.start()
	if trigger_activated:
		$RigidBody2D.mode=RigidBody2D.MODE_RIGID
	else :
		$RigidBody2D.mode=RigidBody2D.MODE_STATIC


func _on_BridgeTrigger_body_entered(body):
	$BridgeTrigger/Sprite/AnimationPlayer.play("show_help")
	can_be_triggered=true
func _on_StaticTimer_timeout():
	trigger_activated=false
func _on_BridgeTrigger_body_exited(body):
	$BridgeTrigger/Sprite/AnimationPlayer.play_backwards("show_help")
	$BridgeTrigger/Sprite/AnimationPlayer.queue("hide")
	can_be_triggered=false

	pass
