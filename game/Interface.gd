extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(bool) var fx = true
export(bool) var music = true
export(bool) var int_scoreboard = false
export(bool) var ext_scoreboard = false
var play_time = 0
var lang = "PL"
export(String) var nick = "a"
var strings_eng = {
 "twoj_wynik": "YOUR SCORE: ",
 "najlepszy_wynik": " HIGHSCORE: ",
 "nowy_najlepszy_wynik":" NEW HISCORE!!!",
 "tip_miny":"TIP: try not to hit the mines :P",
 "tip_ox": "TIP: to get oxygen swim to the top",
 "zagraj_jeszcze_raz":"Play again",
 "przegrales":"You died :(",
 "monety":" coins",
 "moneta":" coin",
 "monet":" coins",
 "czas_gry": "Playtime: ",
 "sc": "SCOREBOARD:"
 }
var strings_pl = {
 "twoj_wynik": "Twój wynik: ",
 "najlepszy_wynik": " Najwyższy wynik: ",
 "nowy_najlepszy_wynik":" NOWY REKORD!!!",
 "tip_miny":"Wskazówka: nie uderzaj w miny wodne :P",
 "tip_ox": "Wskazówka: aby uzyskać tlen wypłyń na powierzchnię",
 "zagraj_jeszcze_raz":"Zagraj ponownie",
 "przegrales":"Przegarłeś :(",
 "monety":" monety",
 "moneta":" moneta",
 "monet":" monet",
 "czas_gry": "Czas gry: ",
 "sc": "TABELA WYNIKÓW:"
 }
export(int) var oxygen_level = 100 
var points = 0
var savegame = File.new()
var sound_setting = File.new()
var hiscore = 0
var strings

#const WRITE_RECORD_REQUEST = { //WRITE_RECORD event is used for both creating first-time record and updating record as well.
#    "event": "write_record",
#    "payload": {
#        "username": username,
#        "unique_key": key,
#        "record": {
#            "time": "MM:SS", //Time is sent in String formatted like "MM:SS" MM - minutes, SS - seconds
#            "score": 43, //Score is sent in numerical type
#        }
#    }
#}

func _request_compleated_get_scoreboard(result, response_code, headers, body):
#	print(parse_json(body.get_string_from_utf8()).size())
	var rekord = parse_json(body.get_string_from_utf8())
#	print(int(String(rekord[0]).substr(0, 10))) # SCORE
#	print(String(rekord[0]).substr(10, 5))
#	print(String(rekord[0]).substr(15))
	if not int(String(rekord[4]).substr(0, 10)) == 0:
		$Control5/PanelContainer/CenterContainer/VBoxContainer/Label2.text = "#1  " + String(rekord[4]).substr(15) + " : "+ String(int(String(rekord[4]).substr(0, 10))) + " (" + String(99 - int(String(rekord[4]).substr(10, 2))) + ":" + String(99 - int(String(rekord[4]).substr(13, 2))) + "s)"
	if not int(String(rekord[3]).substr(0, 10)) == 0:
		$Control5/PanelContainer/CenterContainer/VBoxContainer/Label3.text = "#2  " + String(rekord[3]).substr(15) + " : "+ String(int(String(rekord[3]).substr(0, 10))) + " (" + String(99 - int(String(rekord[3]).substr(10, 2))) + ":" + String(99 - int(String(rekord[3]).substr(13, 2))) + "s)"
	if not int(String(rekord[2]).substr(0, 10)) == 0:
		$Control5/PanelContainer/CenterContainer/VBoxContainer/Label4.text = "#3  " + String(rekord[2]).substr(15) + " : "+ String(int(String(rekord[2]).substr(0, 10))) + " (" + String(99 - int(String(rekord[2]).substr(10, 2))) + ":" + String(99 - int(String(rekord[2]).substr(13, 2))) + "s)"
	if not int(String(rekord[1]).substr(0, 10)) == 0:
		$Control5/PanelContainer/CenterContainer/VBoxContainer/Label5.text = "#4  " + String(rekord[1]).substr(15) + " : "+ String(int(String(rekord[1]).substr(0, 10))) + " (" + String(99 - int(String(rekord[1]).substr(10, 2))) + ":" + String(99 - int(String(rekord[1]).substr(13, 2))) + "s)"
	if not int(String(rekord[0]).substr(0, 10)) == 0:
		$Control5/PanelContainer/CenterContainer/VBoxContainer/Label6.text = "#5  " + String(rekord[0]).substr(15) + " : "+ String(int(String(rekord[0]).substr(0, 10))) + " (" + String(99 - int(String(rekord[0]).substr(10, 2))) + ":" + String(99 - int(String(rekord[0]).substr(13, 2))) + "s)"
	$Control5.show()
	pass
	

func _on_NetworkNode_data_received(data):
	print(data["event"])
	if data["event"] == "READ_BOARD":
		print(data["payload"]["board"])
		var label = preload("res://elements/scoreboard_entry/ScoreBoardEntry.tscn")
		var _ccounter = 1
		for entry in data["payload"]["board"]:
			var this_scbe = label.instance()
			this_scbe.text = "#" + String(_ccounter) + "  " + String(entry["score"]) + " : "+ entry["username"] + " (" + entry["time"] + "s)"
			if _ccounter == 1:
				this_scbe.add_color_override("font_color", Color(0.74902, 0.752941, 0.113725))
			$Control7/CenterContainer/PanelContainer/ScrollContainer/VBoxContainer.add_child(this_scbe)
			$Control7.show()
			_ccounter += 1
			print(entry["score"], "czas:", entry["time"], "usr:", entry["username"])
#		ustawianie scorebarda
	if data["event"] == "READ_RECORD_REQUEST":
		pass
#		sprawdzanie "rankingu" gracza
	
	pass # Replace with function body.


# Called when the node enters the scene tree for the first time.
func _ready():
	if OS.get_name() == "HTML5":
#		print("username: ",JavaScript.eval("sessionStorage['username']") == null)
#		print("username: ",JavaScript.eval("localStorage['username']") == null)
		if not JavaScript.eval("sessionStorage['username']") == null:
			ext_scoreboard = true
			$"../NetworkNode".send_message({"event":"read_board", "payload":{}})
		else:
			print("User not logged in!!!")
	if OS.get_name() == "HTML5":
#		print(JavaScript.eval("localStorage['lang']"))
		lang = JavaScript.eval("localStorage['lang']")
		if not (lang == "EN" or lang == "PL"):
			lang = "EN"
	if lang == "PL":
		strings = strings_pl
	elif lang == "EN":
		strings = strings_eng
	if OS.get_name() == "Android" or JavaScript.eval("(('ontouchstart' in window) || (navigator.maxTouchPoints > 0) || (navigator.msMaxTouchPoints > 0));") == true:
		$Control4/Joystick.show()
#		nick = $"../..".username
		int_scoreboard = true
		$Control4/Joystick.set_size(1.2)
#	if not OS.get_name() == "HTML5" and not JavaScript.eval("localStorage['username']") == "":
#		nick = JavaScript.eval("localStorage['username']")
#		int_scoreboard = true
	if int_scoreboard:
		$Control5/PanelContainer/CenterContainer/VBoxContainer/Label.text = strings["sc"]
		var request = HTTPRequest.new()
		add_child(request)
		request.connect("request_completed", self, "_request_compleated_get_scoreboard")
		request.request("http://akr0nys.ddns.net/scoreboard.json")
		
	if sound_setting.file_exists("user://sound.save"):
		sound_setting.open("user://sound.save", File.READ)
		music = sound_setting.get_var()
		fx = music
		sound_setting.close()
		if music:
			$Control/HBoxContainer/TextureRect.texture = preload("res://assets/speaker-loud.png")
			$AudioStreamPlayer.stream =  preload("res://assets/music/background.wav")
			$AudioStreamPlayer.play()
			$Control/HBoxContainer/CheckButton.pressed = true
		else:
			$Control/HBoxContainer/TextureRect.texture = preload("res://assets/speaker-quiet.png")
			$AudioStreamPlayer.stream =  null
			$Control/HBoxContainer/CheckButton.pressed = false
		
	if savegame.file_exists("user://savegame.save"):
		savegame.open_encrypted_with_pass("user://savegame.save", File.READ, "sfn2021asd")
		hiscore = savegame.get_64()
	$Popup/Panel/Label2.text = strings["tip_ox"]
	$Popup/Panel/CenterContainer/VBoxContainer/Label.text = strings["przegrales"]
	$Popup/Panel/CenterContainer/VBoxContainer/Button.text = strings["zagraj_jeszcze_raz"]
	$Control3/HBoxContainer/Label.text = "0 " + strings["monet"]
	if music:
		$AudioStreamPlayer.play()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control2/Panel/ProgressBar.value = oxygen_level
	if oxygen_level < 0 and not $Popup.visible:
#		print("dead")
		$AudioStreamPlayer.stream = null
		$AudioStreamPlayer2.stream = null
		$AudioStreamPlayer3.stream = null
		$AudioStreamPlayer4.stream = null
		if music:
			$AudioStreamPlayer5.play()
		$Timer.stop()
		if OS.get_name() == "Android":
			var font = DynamicFont.new()
			font.font_data = preload("res://assets/Bariol_Regular_Webfont.ttf")
			font.size = 48
			font.set_outline_size(1)
			font.set_outline_color(Color(0.062745, 0.192157, 0.192157))
			$Popup/Panel/CenterContainer/VBoxContainer/Button.add_font_override("font", font)
			$Popup/Panel/CenterContainer/VBoxContainer/Button.rect_min_size.x = 550
			$Popup/Panel/CenterContainer/VBoxContainer/Button.rect_min_size.y = 80
		$Popup/Panel/Label4.text = strings["czas_gry"] + String(floor(play_time / 60)) + ":" + String("%02d" % floor(play_time % 60))
		if points > hiscore:
			savegame.open_encrypted_with_pass("user://savegame.save", File.WRITE, "sfn2021asd")
			savegame.store_64(points)
			savegame.close()
			$Popup/Panel/Label3.text = strings["twoj_wynik"] + String(points) + "\n" + strings["najlepszy_wynik"] + String(points) + strings["nowy_najlepszy_wynik"]
			$Popup/Panel/Label3.add_color_override("font_color", Color(0.8, 0, 0))
			$Popup/Panel/Label3.add_color_override("font_color_shadow", Color(0.6, 0.1, 0.1))
		else:
			$Popup/Panel/Label3.text = strings["twoj_wynik"] + String(points) + "\n" + strings["najlepszy_wynik"] + String(hiscore)
		if ext_scoreboard:
			var write_request = {
			"event": "write_record",
				 "payload": {
					"username": JavaScript.eval("sessionStorage['username']"),
					"unique_key": JavaScript.eval("sessionStorage['unique_key']"),
					"record": {
						"time": String(floor(play_time / 60)) + ":" + String("%02d" % floor(play_time % 60)),
						"score": points, 
					}
				}
			}
			$"../NetworkNode".send_message(write_request)
			print(write_request)
		if int_scoreboard:
			var sc_update_request = HTTPRequest.new()
			add_child(sc_update_request)
			sc_update_request.request("http://akr0nys.ddns.net/api.php?name="+ nick+"&score="+String(points)+"&time="+ String("%02d" %(99-floor(play_time / 60))) + ":" + String("%02d" % (99-floor(play_time % 60))))
#			print("http://akr0nys.ddns.net/api.php?name="+ String(nick)+"&score="+String(points)+"&time="+ String("%02d" %(99-floor(play_time / 60))) + ":" + String("%02d" % (99-floor(play_time % 60))))
		$Popup.popup()
	pass


func _on_OxygenTimer_timeout():
	if $"../Game/Air".player_is_in_water:
		oxygen_level -= 1
	else:
		oxygen_level += 10
	if oxygen_level < 15:
		$AnimationPlayer.play("progress bar tint")
		if fx:
			$AudioStreamPlayer3.play()
	if oxygen_level < 30:
		$Control2/Panel/ProgressBar.self_modulate = Color(0.8,0,0)
	else:
		$Control2/Panel/ProgressBar.self_modulate = Color(1,1,1)
	if oxygen_level > 100:
		oxygen_level = 100
	pass # Replace with function body.


func _on_Player_bumped_into_rocks():
	if fx:
		$AudioStreamPlayer4.play()
	if oxygen_level > 15:
		oxygen_level -= 15
	else:
		oxygen_level -= 3
	$AnimationPlayer.play("progress bar tint")
	pass # Replace with function body.


func _on_Terrain_chest_opened(id):
	points += 1
	if fx:
		$AudioStreamPlayer2.play()
	if lang == "EN":
		if points == 1:
			$Control3/HBoxContainer/Label.text = String(points) + strings["moneta"]
		else:
			$Control3/HBoxContainer/Label.text = String(points) + strings["monety"]
	if lang == "PL":
		if points == 1:
			$Control3/HBoxContainer/Label.text = String(points) + strings["moneta"]
		elif points <= 4 or (points > 20 and (String(points).ends_with("2") or String(points).ends_with("3") or String(points).ends_with("4"))):
			$Control3/HBoxContainer/Label.text = String(points) + strings["monety"]
		else:
			$Control3/HBoxContainer/Label.text = String(points) + strings["monet"]
			
	oxygen_level += 13
	pass # Replace with function body.


func _on_Button_pressed():
	get_tree().change_scene("res://main.tscn")
	pass # Replace with function body.




func _on_Terrain_bomb_exploded():
	oxygen_level = -1
	$Popup/Panel/Label2.text = strings["tip_miny"]
	pass # Replace with function body.


func bubbles_entered():
	oxygen_level += 8
	pass # Replace with function body.


func _on_Timer_timeout():
	play_time += 1
	pass # Replace with function body.

var dead_zone = 15
func _on_Joystick_moved_raw(direction):
	Input.action_release("move_down")
	Input.action_release("move_up")
	Input.action_release("move_left")
	Input.action_release("move_right")
	if direction.x > dead_zone:
		Input.action_press("move_right")
	if direction.x < -dead_zone:
		Input.action_press("move_left")
	if direction.y > dead_zone:
		Input.action_press("move_down")
	if direction.y < -dead_zone:
		Input.action_press("move_up")
		
	$"../Game/Player".side_force_multiplier = abs(direction.x / 100)
	$"../Game/Player".vertical_force_multiplier = abs(direction.y / 300)
#	print($"../Game/Player".side_force_multiplier)
#	print($"../Game/Player".vertical_force_multiplier)
	pass # Replace with function body.


func _on_Joystick_released():
	Input.action_release("move_down")
	Input.action_release("move_up")
	Input.action_release("move_left")
	Input.action_release("move_right")
	pass # Replace with function body.


func _on_AudioStreamPlayer_finished():
	$AudioStreamPlayer.play()
	pass # Replace with function body.


func _on_AudioStreamPlayer3_finished():
	if oxygen_level < 15:
		$AudioStreamPlayer3.play()
	pass # Replace with function body.


func _on_CheckButton_toggled(button_pressed):
#	print(button_pressed)
	if button_pressed:
		$Control/HBoxContainer/TextureRect.texture = preload("res://assets/speaker-loud.png")
		$AudioStreamPlayer.stream =  preload("res://assets/music/background.wav")
		$AudioStreamPlayer.play()
		music = true
		fx = true
	else:
		$Control/HBoxContainer/TextureRect.texture = preload("res://assets/speaker-quiet.png")
		$AudioStreamPlayer.stream =  null
		music = false
		fx = false
	sound_setting.open("user://sound.save", File.WRITE)
	sound_setting.store_var(music)
	sound_setting.close()
	pass # Replace with function body.
func upadte_scoreboard(scoreboard_data: Array):
	$Control5/PanelContainer/CenterContainer/VBoxContainer/Label2.text = scoreboard_data[0]
	$Control5/PanelContainer/CenterContainer/VBoxContainer/Label3.text = scoreboard_data[1]
	$Control5/PanelContainer/CenterContainer/VBoxContainer/Label4.text = scoreboard_data[2]
	$Control5/PanelContainer/CenterContainer/VBoxContainer/Label5.text = scoreboard_data[3]
	$Control5/PanelContainer/CenterContainer/VBoxContainer/Label6.text = scoreboard_data[4]
	$Control5.show()
	pass





