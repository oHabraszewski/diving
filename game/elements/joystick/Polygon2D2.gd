extends Polygon2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var size = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _draw():
	draw_circle(Vector2(0,0), size, self.color)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
