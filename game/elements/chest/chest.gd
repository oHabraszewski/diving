extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	$Sprite.texture = preload("res://assets/chest-open.png")
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
	$Sprite.texture = preload("res://assets/chest-closed.png")
	pass # Replace with function body.
