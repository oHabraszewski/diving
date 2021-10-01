extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var strings = {
 "twoj_wynik": "YOUR SCORE: ",
 "najlepszy_wynik": " HIGHSCORE: ",
 "nowy_najlepszy_wynik":" NEW HISCORE!!!",
 "tip_miny":"TIP: try not to hit the mines :P",
 "tip_ox": "TIP: to get oxygen swim to the top",
 "zagraj_jeszcze_raz":"PLAY AGAIN",
 "przegrales":"you died :(",
 "monety":" coins",
 "moneta":" coin"
 }
export(int) var oxygen_level = 100 
var points = 0
var savegame = File.new()
var hiscore = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	if savegame.file_exists("user://savegame.save"):
		savegame.open_encrypted_with_pass("user://savegame.save", File.READ, "sfn2021asd")
		hiscore = savegame.get_64()
	$Popup/Panel/Label2.text = strings["tip_ox"]
	$Popup/Panel/Label.text = strings["przegrales"]
	$Popup/Panel/Button.text = strings["zagraj_jeszcze_raz"]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control2/Panel/ProgressBar.value = oxygen_level
	if oxygen_level < 0:
		if points > hiscore:
			savegame.open_encrypted_with_pass("user://savegame.save", File.WRITE, "sfn2021asd")
			savegame.store_64(points)
			savegame.close()
			$Popup/Panel/Label3.text = strings["twoj_wynik"] + String(points) + "\n" + strings["najlepszy_wynik"] + String(points) + strings["nowy_najlepszy_wynik"]
			$Popup/Panel/Label3.add_color_override("font_color", Color(0.8, 0, 0))
			$Popup/Panel/Label3.add_color_override("font_color_shadow", Color(0.6, 0.1, 0.1))
		else:
			$Popup/Panel/Label3.text = strings["twoj_wynik"] + String(points) + "\n" + strings["najlepszy_wynik"] + String(hiscore)
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
		$Control3/HBoxContainer/Label.text = String(points) + strings["moneta"]
	else:
		$Control3/HBoxContainer/Label.text = String(points) + strings["monety"]
	oxygen_level += 13
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://main.tscn")
	pass # Replace with function body.




func _on_Terrain_bomb_exploded():
	oxygen_level = -1
	$Popup/Panel/Label2.text = strings["tip_miny"]
	pass # Replace with function body.
