extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var oxygen_level = 100 
var points = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control2/Panel/ProgressBar.value = oxygen_level
	if oxygen_level < 0:
		$Popup.popup()
	pass


func _on_OxygenTimer_timeout():
	
	if $"../Game/Air".player_is_in_water:
		oxygen_level -= 1
	else:
		oxygen_level += 10
	if oxygen_level < 15:
		$AnimationPlayer.play("progress bar tint")
	if oxygen_level > 100:
		oxygen_level = 100
	pass # Replace with function body.


func _on_Player_bumped_into_rocks():
	if oxygen_level > 15:
		oxygen_level -= 15
	else:
		oxygen_level -= 3
	$AnimationPlayer.play("progress bar tint")
	pass # Replace with function body.


func _on_Terrain_chest_opened(id):
	points += 1
	if points == 1:
		$Control3/HBoxContainer/Label.text = String(points) + " coin"
	else:
		$Control3/HBoxContainer/Label.text = String(points) + " coins"
	oxygen_level += 13
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://main.tscn")
	pass # Replace with function body.
