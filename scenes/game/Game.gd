extends Spatial

var player_start_position = Vector3(8.5, 0.6, 26)# 玩家开始位置
var start_game_info = [# 游戏开始时的提示信息
	"按下WASD进行移动",
	"移动鼠标进行视角旋转",
	"按F5进行视角切换",
	"到达3楼办公室制作教学PPT",
	"到达2楼8D1教室进行教学"
]

func _ready():
	new_day()
	GlobalUi.enter_game()
	for info in start_game_info:
		GlobalUi.send_info(info)
		yield(get_tree().create_timer(7), "timeout")


func _process(delta):
	Data.now_time = int($DayTime.wait_time - 1)


# 新的一天
func new_day():
	Data.now_day += 1
	if Data.now_day == 6:
		game_over()
		return
	Data.coins += 150
	GlobalUi.next_day()
	yield(get_tree().create_timer(0.5), "timeout")
	$Teacher.translation = player_start_position
	$AnimationPlayer.play("Day")

# 改变时间
func add_time(time):
	$AnimationPlayer.seek($DayTime.wait_time + time, true)

# 游戏结束
func game_over():
	SceneChanger.change_scene("res://scenes/game/GameOver.tscn")


func _on_AnimationPlayer_animation_finished(anim_name):
	new_day()


func _on_DropArea_body_entered(body):
	if body.name == "Teacher":
		$Teacher.translation = player_start_position
		GlobalUi.send_info("请在游戏区域内移动！")
