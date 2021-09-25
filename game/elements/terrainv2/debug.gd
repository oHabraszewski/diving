extends Polygon2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var vectors_to_draw = [Vector2(0,0)]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _draw():
	draw_circle(Vector2(0, 0), 2, Color(255,0,0))
	draw_line(Vector2(0, 0), Vector2(100 / 2, 100 / 2), Color(1,0,0))
	var color = 0
	var color_second = 0
	var rng = RandomNumberGenerator.new()
	for i in vectors_to_draw:
		draw_line(Vector2(0, 0), Vector2(i.x*10, i.y*10), Color(0, color_second, color))
		color = rng.randf_range(0,1)
		color_second = rng.randf_range(0,1)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

