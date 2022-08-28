extends Control

func _ready():
	GlobalUi.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var score = 0
	var talked_chapter_score = Data.talked_chapters.size() * 5
	var _exp = 0
	for ce in Data.chapters_exp:
		_exp += ce
	score += talked_chapter_score * _exp * 5
	score += Data.coins * 8
	score += Data.test_chapters.size() * 5
	$MarginContainer/VBoxContainer/Score.text = "你的分数是:%d" % score


func _on_Quit_pressed():
	get_tree().quit()


func _on_Back_pressed():
	SceneChanger.change_scene("res://scenes/menu/Menu.tscn")


func _on_Again_pressed():
	SceneChanger.change_scene("res://scenes/game/Game.tscn")
