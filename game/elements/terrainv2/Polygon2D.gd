tool
extends Polygon2D

export(Color) var OutLine = Color(0,0,0) setget set_color
export(float) var Width = 2.0 setget set_width
export(bool) var draw = false
export(bool) var draw_points = false
export var red_p_t_d = []
export var points_to_draw = [] 
func _draw():
	if not get_polygon().empty():
		var poly = get_polygon()
		for i in range(1 , poly.size()):
			draw_line(poly[i-1] , poly[i], OutLine , Width)
		draw_line(poly[poly.size() - 1] , poly[0], OutLine , Width)
		if draw_points:
			var rng = RandomNumberGenerator.new()
			var incrementer = 0
			var clr = Color(rng.randf_range(0, 1),rng.randf_range(0, 1),rng.randf_range(0, 1))
			for i in red_p_t_d:
				if incrementer == 2:
					clr = Color(rng.randf_range(0, 1),rng.randf_range(0, 1),rng.randf_range(0, 1))
					incrementer = 0
				draw_circle(i, 2, clr)
				incrementer += 1
			for i in points_to_draw:
				draw_circle(i, 1, Color(0,1,0))
			pass
		if draw:
			var rng = RandomNumberGenerator.new()
			var incrementer = 0
			var clr = Color(rng.randf_range(0, 1),rng.randf_range(0, 1),rng.randf_range(0, 1))
#			for i in $"..".red_p_t_d:
#				if incrementer == 2:
#					clr = Color(rng.randf_range(0, 1),rng.randf_range(0, 1),rng.randf_range(0, 1))
#					incrementer = 0
#				draw_circle(i, 6, clr)
#				incrementer += 1
##		#		print(i)
#			for i in $"..".points_to_draw:
#				draw_circle(i, 20, Color(0,0,0))
				
			for i in range(100):
				draw_line(Vector2(0, i*100), Vector2(1000*10, i*100), Color(0, 0, 0))
				draw_line(Vector2(i*100, 0), Vector2(i*100, 1000*10), Color(0, 0, 0))
			
func set_color(color):
	OutLine = color
	update()

func set_width(new_width):
	Width = new_width
	update()
