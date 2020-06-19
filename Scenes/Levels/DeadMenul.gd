extends Control
func _ready():
	visible=false
func _process(delta):
	if get_parent().get_node("Players").get_child_count()==0:
		visible=true
