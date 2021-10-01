extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var shape = SegmentShape2D.new()
export var player_is_in_water = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func player_moved(player):
	self.position.x = player.position.x
	pass
func player_entered_bubbles():
	pass
func player_exited_bubbles():
	pass

func _on_Area2D2_area_entered(area):
	if player_is_in_water:
		$"../../ParallaxBackground/AnimationPlayer".play("change_bck_to_air")
	player_is_in_water = false
	pass # Replace with function body.


func _on_Area2D2_area_exited(area):
	if not player_is_in_water:
		$"../../ParallaxBackground/AnimationPlayer".play_backwards("change_bck_to_air")
	player_is_in_water = true
	pass # Replace with function body.
