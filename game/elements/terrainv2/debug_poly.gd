extends Polygon2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var points = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _draw():
	for i in points:
		draw_circle(i, 5, Color(1,1,1))
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_left"):
		$"../Polygon2DKrztaltTerenu".position.x += 10
	if Input.is_action_pressed("move_right"):
		$"../Polygon2DKrztaltTerenu".position.x -= 10
	if Input.is_action_pressed("move_up"):
		$"../Polygon2DKrztaltTerenu".position.y += 10
	if Input.is_action_pressed("move_down"):
		$"../Polygon2DKrztaltTerenu".position.y -= 10
	pass
