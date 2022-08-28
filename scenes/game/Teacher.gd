extends KinematicBody

var mouse_sen = 0.1# 鼠标灵敏度
var speed = 15# 行走速度
var gravity = 40# 重力速度
var jump = 15# 跳跃速度

var dir = Vector3()# 方向
var movement = Vector3()# 移动
var gravity_vel = Vector3()# 重力值

# 相机视角
var camera_tr = [
	[
		Vector3(0, 0, -1.2),
		Vector3.ZERO
	],
	[
		Vector3(0, 2, 5),
		Vector3(-20, 0, 0)
	],
	[
		Vector3(0, 0, -8),
		Vector3(0, 180, 0)
	]
]
# 视角索引
var camera_index = 0
# 相机移动速度
var weight_speed = 0.1

onready var head = $head
onready var camera = $head/Camera


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion and Data.player_can_move:
		rotate_y(deg2rad(-event.relative.x * mouse_sen))
		head.rotate_x(deg2rad(-event.relative.y * mouse_sen))
		head.rotation.x = clamp(head.rotation.x, deg2rad(-60), deg2rad(70))

func _physics_process(delta):
	dir = Vector3()
	
	if Data.player_can_move:
		# 重力
		if not is_on_floor():
			gravity_vel += Vector3.DOWN * gravity * delta
		
		# 跳跃
		if Input.is_action_just_pressed("key_space") and is_on_floor():
			gravity_vel = Vector3.UP * jump
		
		if Input.is_action_pressed("key_w"):
			dir -= transform.basis.z
		elif Input.is_action_pressed("key_s"):
			dir += transform.basis.z
		if Input.is_action_pressed("key_a"):
			dir -= transform.basis.x
		elif Input.is_action_pressed("key_d"):
			dir += transform.basis.x
		
		# 视角切换
		if Input.is_action_just_pressed("key_f5"):
			if camera_index == 2:
				camera_index = 0
			else:
				camera_index += 1
	
	# 相机移动
	camera.translation = lerp(camera.translation, camera_tr[camera_index][0], weight_speed)
	camera.rotation_degrees = lerp(camera.rotation_degrees, camera_tr[camera_index][1], weight_speed)
	
	dir = dir.normalized()
	movement = dir * speed + gravity_vel
	
	move_and_slide(movement, Vector3.UP)
