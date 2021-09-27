extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var opened = false
export var chest_id = ""
signal opened(id)
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
		$Particles2D2.emitting = true
		opened = true
		emit_signal("opened", chest_id)
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
#	$Sprite.texture = preload("res://assets/chest-closed.png")
	pass # Replace with function body.
