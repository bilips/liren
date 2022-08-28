extends Node

var now_day = 0# 现在天数
var max_day = 6# 最大天数
var now_time = 0# 现在时间

var chapters: Array = []# 所有章节
var can_talk_chapters: Array = []# 可以讲的章节
var talked_chapters: Array = []# 已经讲过的章节
var chapters_progress: Array = [0, 0, 0, 0, 0, 0]# 章节完成度
var test_chapters: Array = []
var chapters_exp: Array = [0, 0, 0, 0, 0, 0]# 章节熟练度

var coins = 0# 钱币
var satiety = 100# 饱食度

var show_fps = true# 显示帧数

var player_can_move = true# 玩家是否可以移动
