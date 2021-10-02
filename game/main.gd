extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
# 1 = mouse and keyboard
# 2 = touch (joystick)
# 3 = gyroscope
#
#
func _ready():
	if OS.get_name() == "Android" and get_node("..").get_children().size() < 2:
		get_tree().change_scene("res://android_popup.tscn")
		
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	if OS.get_name() == "Android" and 2 == 3: 
#		var acc_inp = Input.get_accelerometer()
#		$Interface/Label.text = String(acc_inp.x) + "\n" + String(acc_inp.y) + "\n" + String(acc_inp.z) 
#		if acc_inp.y < -3:
##			$Interface/Label.text = $Interface/Label.text + "\n" + String(abs(acc_inp.y + 3) /10)
#			$Game/Player.vertical_force_multiplier =abs((acc_inp.y + 3) /7)
#			Input.action_release("move_up")
#			Input.action_press("move_down")
#		elif acc_inp.y > 3:
#			$Game/Player.vertical_force_multiplier = abs((acc_inp.y + 3) / 7)
#			Input.action_release("move_down")
#			Input.action_press("move_up")
#		else:
#			Input.action_release("move_up")
#			Input.action_release("move_down")
#		if acc_inp.x > 3:
#			$Game/Player.side_force_multiplier = abs((acc_inp.x - 3) / 7) 
#			Input.action_release("move_left")
#			Input.action_press("move_right")
#		elif acc_inp.x < -3:
#			$Game/Player.side_force_multiplier = abs((acc_inp.x + 3) / 7)
#			Input.action_release("move_right")
#			Input.action_press("move_left")
#		else:
#			Input.action_release("move_right")
#			Input.action_release("move_left")
#
#	
#	$Interface/Control/Label.text = "Player position: " + String($Game/Player.position) + "\n Player current chunk: " + String(floor((($Game/Player.position.x - $Game/Terrain.position.x) / ($Game/Terrain.segment_size.x * $Game/Terrain.segment_count_x))) ) #DEV
	pass
	
func _on_Button_pressed():
#	var nums = [1,2,3]
#	print("====NUMS====")
#	print(nums)
#	var asd = nums.pop_front()
#	print(nums)
#	$Interface/Control/Label.text = String(asd)
#	print(nums)
#	nums.append(asd)
#	print(nums)
#	$Interface/Control/Label.text = String(nums.pop_back())
#	print(nums)
#
#
#	nums = [1,2,3]
#	print("====NUMS====")
#	print(nums)
#	asd = nums.pop_back()
#	print(nums)
#	$Interface/Control/Label.text = String(asd)
#	print(nums)
#	nums.insert(0,asd)
#	print(nums)
#	$Interface/Control/Label.text = String(nums.pop_back())
#	print(nums)
	pass # Replace with function body.
