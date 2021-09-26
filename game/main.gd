extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Interface/Control/Label.text = "Player position: " + String($Game/Player.position) + "\n Player current chunk: " + String(floor((($Game/Player.position.x - $Game/Terrain.position.x) / ($Game/Terrain.segment_size.x * $Game/Terrain.segment_count_x))) ) #DEV
	pass
	
func _on_Button_pressed():
	$Interface/Popup.popup()
	pass # Replace with function body.
