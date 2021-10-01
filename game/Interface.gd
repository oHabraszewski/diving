extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var oxygen_level = 100 
var points = 0
var savegame = File.new()
var hiscore = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	if savegame.file_exists("user://savegame.save"):
		savegame.open_encrypted_with_pass("user://savegame.save", File.READ, "sfn2021asd")
		hiscore = savegame.get_64()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control2/Panel/ProgressBar.value = oxygen_level
	if oxygen_level < 0:
		if points > hiscore:
			savegame.open_encrypted_with_pass("user://savegame.save", File.WRITE, "sfn2021asd")
			savegame.store_64(points)
			savegame.close()
			$Popup/Panel/Label3.text = "YOUR SCORE: " + String(points) + "\n HIGHSCORE: " + String(points) + " NEW HISCORE!!!"
			$Popup/Panel/Label3.add_color_override("font_color", Color(0.8, 0, 0))
			$Popup/Panel/Label3.add_color_override("font_color_shadow", Color(0.6, 0.1, 0.1))
		else:
			$Popup/Panel/Label3.text = "YOUR SCORE: " + String(points) + "\n HIGHSCORE: " + String(hiscore)
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




func _on_Terrain_bomb_exploded():
	oxygen_level = -1
	$Popup/Panel/Label2.text = "TIP: TRY NOT TO HIT THE MINES :p"
	pass # Replace with function body.
