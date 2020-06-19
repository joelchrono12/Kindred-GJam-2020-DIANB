extends Control


func _on_BacktoMenu_pressed():
	get_tree().change_scene("res://Control.tscn")


func _on_QuitGame_pressed():
	get_tree().quit()
