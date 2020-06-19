extends Area2D
export (String,FILE,"*tscn") var path
func _on_Area2D_body_entered(body):
	print("changing scene")
	body.get_node("AnimationPlayer").play("selected")
	$ChangingScene.start()
	


func _on_ChangingScene_timeout():
	get_parent().get_tree().change_scene(path)
	pass # Replace with function body.
