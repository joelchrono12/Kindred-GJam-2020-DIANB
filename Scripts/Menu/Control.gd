extends Control
func _ready():
	$AnimationPlayer.play("menu")
func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/Levels/World1.tscn")


func _on_QuitGame_pressed():
	get_tree().quit()


func _on_About_pressed():
	get_tree().change_scene("res://Scenes/Menu/About Screen.tscn")


func _on_FullScreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
