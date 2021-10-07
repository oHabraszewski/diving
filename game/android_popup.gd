extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String) var username = ""
export(String) var lang = "EN"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
var strings_eng = {"graj":"PLAY", "ch_usr":"Choose username.", "usr_l":"Username cannot be longer than 16 characters.", "qu":"Quality"}
var strings_pl = {"graj":"GRAJ", "ch_usr":"Wybierz nazwę użytkownika.", "usr_l":"Nazwa użytkownika może mieć do 16 znaków.", "qu":"Jakość"}
var strings = strings_eng
func _on_Button_pressed():
	if $Panel/CenterContainer/VBoxContainer/LineEdit.text.length() > 0:
		if $Panel/CenterContainer/VBoxContainer/LineEdit.text.length() < 16:
			username = $Panel/CenterContainer/VBoxContainer/LineEdit.text
			var game = preload("res://main.tscn")
			get_node(".").add_child(game.instance())
			self.hide()
		else:
			$Panel/CenterContainer/VBoxContainer/Label2.show()
			$Panel/CenterContainer/VBoxContainer/Label2.text = strings["usr_l"]
	else:
		$Panel/CenterContainer/VBoxContainer/Label2.show()
		$Panel/CenterContainer/VBoxContainer/Label2.text = strings["ch_usr"]
	pass # Replace with function body.


func _on_Button2_pressed():
	if lang == "EN":
		lang = "PL"
		strings = strings_pl
		$Panel/Button2.icon = preload("res://assets/poland.png")
		$Panel/Button2.text = "PL"
	else:
		lang = "EN"
		strings = strings_eng
		$Panel/Button2.icon = preload("res://assets/great_britan.png")
		$Panel/Button2.text = "EN"
	$Panel/CenterContainer/VBoxContainer/Label2.hide()
	$Panel/CenterContainer/VBoxContainer/Button.text = strings["graj"]
	$Popup/Panel/HBoxContainer/HBoxContainer/Label.text = strings["qu"]
	pass # Replace with function body.


func _on_ButtonGH_pressed():
	OS.shell_open("https://github.com/oHabraszewski/sfn2021")
	pass # Replace with function body.


func _on_ButtonDSC_pressed():
	OS.shell_open("https://discord.gg/B7V3cJrrd3")
	pass # Replace with function body.


func _on_Button3_pressed():
	$Popup.popup()
	pass # Replace with function body.
