extends Control

var tab_show = false
onready var tab_panel = $TabPanel


func flag_tab():
	if !tab_show:
		$TabPanel/AnimationPlayer.play("Flag")
		tab_show = true

func _on_Start_pressed():
	SceneChanger.change_scene("res://scenes/game/Game.tscn")


func _on_Setting_pressed():
	tab_panel.current_tab = 0
	flag_tab()


func _on_HowToPlay_pressed():
	tab_panel.current_tab = 1
	flag_tab()


func _on_Quit_pressed():
	get_tree().quit()


func _on_TabClose_pressed():
	tab_show = false
	$TabPanel/AnimationPlayer.play_backwards("Flag")


func _on_ShowFPS_toggled(button_pressed):
	Data.show_fps = button_pressed


func _on_FullScreen_toggled(button_pressed):
	OS.window_fullscreen = button_pressed
