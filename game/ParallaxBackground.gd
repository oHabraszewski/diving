extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var backgrounds 


# Called when the node enters the scene tree for the first time.
func _ready():
	backgrounds = [$Sprite3, $Sprite, $Sprite4]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite2.position.x = $"../Game/Player".position.x
	$Sprite3.modulate = $Sprite.modulate
	$Sprite4.modulate = $Sprite.modulate
	print($"../Game/Player".position.x)
	if $"../Game/Player".position.x > backgrounds[1].position.x + 23040 - 1080:
		var asd = backgrounds.pop_front()
		asd.position.x += 23040*3
		backgrounds.append(asd)
	elif $"../Game/Player".position.x < backgrounds[1].position.x - 23040 + 1080:
		var asd = backgrounds.pop_back()
		asd.position.x -= 23040*3
		backgrounds.insert(0,asd)
	pass

