extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var opened = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if not opened:
		$Sprite.texture = preload("res://assets/chest-open.png")
		$Particles2D.emitting = true
		opened = true
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
#	$Sprite.texture = preload("res://assets/chest-closed.png")
	pass # Replace with function body.
