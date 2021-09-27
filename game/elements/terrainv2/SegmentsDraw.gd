extends Polygon2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(Array) var segments_to_draw = []
var segment_size   = Vector2(100, -100)
var segment_offset = Vector2(50, 50)
enum Direction {RIGHT = 0, LEFT = 1, UP = 2, DOWN = 3, NONE = 4}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func show_segemnts(segments: Array):
	segments_to_draw = segments
	self.update()
	pass
func _draw():
	for i in range(segments_to_draw.size()):
		draw_line(Vector2((segment_size.x*i),0), Vector2(((segment_size.x*i)),(segment_size.y*segments_to_draw.size())), Color(0, 0.5, 0), 5)
		for j in range(segments_to_draw[i].size()):
			draw_line(Vector2(0,(segment_size.y*j)), Vector2(((segment_size.x*segments_to_draw[i].size())),(segment_size.y*j)), Color(0, 0.5, 0), 5)
			
			if segments_to_draw[i][j] == 0:
				draw_line(Vector2((segment_size.x*i)+segment_offset.x,(segment_size.y*j)+segment_offset.y),      Vector2(((segment_size.x*i)+segment_offset.x+20),(segment_size.y*j)+segment_offset.y), Color(1, 0.5, 0), 3)
				draw_line(Vector2((segment_size.x*i)+segment_offset.x+6,(segment_size.y*j)+segment_offset.y+10), Vector2(((segment_size.x*i)+segment_offset.x+20),(segment_size.y*j)+segment_offset.y), Color(1, 0.5, 0), 3)
				draw_line(Vector2((segment_size.x*i)+segment_offset.x+6,(segment_size.y*j)+segment_offset.y-10), Vector2(((segment_size.x*i)+segment_offset.x+20),(segment_size.y*j)+segment_offset.y), Color(1, 0.5, 0), 3)
			elif segments_to_draw[i][j] == 1:
				draw_line(Vector2((segment_size.x*i)+segment_offset.x,(segment_size.y*j)+segment_offset.y),      Vector2(((segment_size.x*i)+segment_offset.x-20),(segment_size.y*j)+segment_offset.y), Color(1, 0.5, 0), 3)
				draw_line(Vector2((segment_size.x*i)+segment_offset.x-6,(segment_size.y*j)+segment_offset.y+10), Vector2(((segment_size.x*i)+segment_offset.x-20),(segment_size.y*j)+segment_offset.y), Color(1, 0.5, 0), 3)
				draw_line(Vector2((segment_size.x*i)+segment_offset.x-6,(segment_size.y*j)+segment_offset.y-10), Vector2(((segment_size.x*i)+segment_offset.x-20),(segment_size.y*j)+segment_offset.y), Color(1, 0.5, 0), 3)
			elif segments_to_draw[i][j] == 2:
				draw_line(Vector2((segment_size.x*i)+segment_offset.x,(segment_size.y*j)+segment_offset.y),      Vector2(((segment_size.x*i)+segment_offset.x),(segment_size.y*j)+segment_offset.y-20), Color(1, 0.5, 0), 3)
				draw_line(Vector2((segment_size.x*i)+segment_offset.x+10,(segment_size.y*j)+segment_offset.y-6), Vector2(((segment_size.x*i)+segment_offset.x),(segment_size.y*j)+segment_offset.y-20), Color(1, 0.5, 0), 3)
				draw_line(Vector2((segment_size.x*i)+segment_offset.x-10,(segment_size.y*j)+segment_offset.y-6), Vector2(((segment_size.x*i)+segment_offset.x),(segment_size.y*j)+segment_offset.y-20), Color(1, 0.5, 0), 3)
			elif segments_to_draw[i][j] == 3:
				draw_line(Vector2((segment_size.x*i)+segment_offset.x,(segment_size.y*j)+segment_offset.y),      Vector2(((segment_size.x*i)+segment_offset.x),(segment_size.y*j)+segment_offset.y+20), Color(1, 0.5, 0), 3)
				draw_line(Vector2((segment_size.x*i)+segment_offset.x+10,(segment_size.y*j)+segment_offset.y+6), Vector2(((segment_size.x*i)+segment_offset.x),(segment_size.y*j)+segment_offset.y+20), Color(1, 0.5, 0), 3)
				draw_line(Vector2((segment_size.x*i)+segment_offset.x-10,(segment_size.y*j)+segment_offset.y+6), Vector2(((segment_size.x*i)+segment_offset.x),(segment_size.y*j)+segment_offset.y+20), Color(1, 0.5, 0), 3)
			elif segments_to_draw[i][j] == 4:
				draw_line(Vector2((segment_size.x*i)+segment_offset.x+15,(segment_size.y*j)+segment_offset.y-15),      Vector2(((segment_size.x*i)+segment_offset.x-15),(segment_size.y*j)+segment_offset.y+15), Color(1, 0.5, 0), 3)
				draw_line(Vector2((segment_size.x*i)+segment_offset.x-15,(segment_size.y*j)+segment_offset.y-15),      Vector2(((segment_size.x*i)+segment_offset.x+15),(segment_size.y*j)+segment_offset.y+15), Color(1, 0.5, 0), 3)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
