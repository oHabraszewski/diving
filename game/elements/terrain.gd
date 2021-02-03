extends Node2D

	
# direction_stucture_organizer
class GeneratorSegment:
	enum avalaible_directions {UP, DOWN, LEFT, RIGHT, NONE}
	var m_direction
	var m_size
	func _init(size = Vector2(0, 0), direction = avalaible_directions.NONE):
		m_size = size
		m_direction = direction
		pass

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(float) var length = 0.0


var terrain_size = Vector2(1000,800)
var test_seed = 1
var messyness = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func generate_terrain_v2(generation_seed, initial_array_of_points):
	var terrain_curve = Curve2D.new()
	var rng = RandomNumberGenerator.new()
	rng.set_seed(generation_seed)
	for i in range(initial_array_of_points.size()):
		print(rng.randf_range(-messyness, messyness))
		#terrain_curve.add_point(Vector2(initial_array_of_points[i].x, initial_array_of_points[i].y), Vector2(rng.randi_range(-messyness, messyness),rng.randi_range(-messyness,messyness)), Vector2(rng.randi_range(-messyness,messyness),rng.randi_range(-messyness,messyness)))
		terrain_curve.add_point(Vector2(initial_array_of_points[i].x, initial_array_of_points[i].y), Vector2(rng.randi_range(-messyness, messyness), rng.randi_range(-messyness, messyness)), Vector2(rng.randi_range(-messyness, messyness), rng.randi_range(-messyness, messyness)))
	$Polygon2D.set("polygon", terrain_curve.tessellate())
	$StaticBody2D/CollisionPolygon2D.set("polygon", terrain_curve.tessellate())
	
	pass

func generate_terrain_v3(generation_seed, initial_array_of_points):
	var terrain_curve = Curve2D.new()
	var rng = RandomNumberGenerator.new()
	rng.set_seed(generation_seed)
	for i in range(initial_array_of_points.size()):
		var controll_point = Vector2(rng.randi_range(-messyness, messyness), rng.randi_range(-messyness, messyness))
		print(controll_point)
		print(controll_point.bounce(Vector2(0,0)))
		terrain_curve.add_point(Vector2(initial_array_of_points[i].x, initial_array_of_points[i].y),controll_point , controll_point.bounce(Vector2(0, 0)))
	$Polygon2D.set("polygon", terrain_curve.tessellate())
	$StaticBody2D/CollisionPolygon2D.set("polygon", terrain_curve.tessellate())
	
	pass

func generate_terrain_v4(generation_seed, initial_array_of_points):
	var terrain_curve = Curve2D.new()
	var rng = RandomNumberGenerator.new()
	rng.set_seed(generation_seed)
	for i in range(initial_array_of_points.size()):
		var controll_point = Vector2(rng.randi_range(-messyness, messyness), rng.randi_range(-messyness, messyness))
		print(controll_point)
		print(controll_point.bounce(Vector2(0,0)))
		terrain_curve.add_point(Vector2(initial_array_of_points[i].x, initial_array_of_points[i].y),controll_point , Vector2(-controll_point.x, -controll_point.y))
	$Polygon2D.set("polygon", terrain_curve.tessellate())
	$StaticBody2D/CollisionPolygon2D.set("polygon", terrain_curve.tessellate())
	
	pass
	

func generate_terrain_v5(generation_seed, start_height = 250, end_height = 250, segment_count_x = 16, segment_count_y = 16, segment_size = Vector2(100, 100)):
	var terrain_curve = Curve2D.new()
	var rng = RandomNumberGenerator.new()
	rng.set_seed(generation_seed)
	terrain_curve.add_point(Vector2(segment_size.x,0),Vector2(0,0),Vector2(0,0))
	var direction_stucture_organizer = []
	for x in range(segment_count_x):
		direction_stucture_organizer.append([])
		direction_stucture_organizer[x] = []
		for y in range(segment_count_y):
			direction_stucture_organizer[x].append([])
			direction_stucture_organizer[x][y] = GeneratorSegment.new(segment_size)
#
#	for x in range(segment_count_x):
#		for y in range(segment_count_y):
#			print(direction_stucture_organizer[x][y].m_direction)
#

	var current_segment = Vector2(0, segment_count_y - floor((start_height / segment_size.y)) -1)
	print(current_segment)
	
	var end_segment =  Vector2(segment_count_x-1, segment_count_y - floor((end_height / segment_size.y)) - 1)
	print(end_segment)
	
	
	while(current_segment != end_segment):
		print(end_segment)
		print("Current segment  X:", current_segment.x, "    Y:", current_segment.y, "         ")
		if direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.UP:
			print("[  UP ]")
		elif direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.DOWN:
			print("[ DOWN]")
		elif direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.RIGHT:
			print("[RIGHT]")
		elif direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.LEFT:
			print("[ LEFT]")
		elif direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.NONE:
			print("[     ]")
			
#		if current_segment.x == segment_count_x-1:
#			print("BORDER X!")
#
#		if current_segment.y == segment_count_y-1:
#			print("BORDER Y!")
			
		# jesli 1 kolumna od lewej, to idz w prawo
		if current_segment.x == 0:
			if direction_stucture_organizer[current_segment.x+1][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.NONE:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.RIGHT
				current_segment.x += 1
			elif direction_stucture_organizer[current_segment.x][current_segment.y+1].m_direction == GeneratorSegment.avalaible_directions.NONE:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.DOWN
				current_segment.y += 1
			elif direction_stucture_organizer[current_segment.x][current_segment.y-1].m_direction == GeneratorSegment.avalaible_directions.NONE:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.UP
				current_segment.y -= 1
			else:
				print("error1")
		elif current_segment.y == 0:
			if direction_stucture_organizer[current_segment.x][current_segment.y+1].m_direction == GeneratorSegment.avalaible_directions.NONE:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.DOWN
				current_segment.y += 1
			elif direction_stucture_organizer[current_segment.x+1][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.NONE:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.RIGHT
				current_segment.x += 1
			else:
				print("error2")
		elif current_segment.y == (segment_count_y - 1):
			var random = rng.randi_range(1, 100)
			if random >= 70 and direction_stucture_organizer[current_segment.x+1][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.NONE:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.RIGHT
				current_segment.x += 1
			elif direction_stucture_organizer[current_segment.x][current_segment.y-1].m_direction == GeneratorSegment.avalaible_directions.NONE:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.UP
				current_segment.y -= 1
			else:
				print("error3")
		elif current_segment.x == (segment_count_x-1):
			if current_segment.y < end_segment.y:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.DOWN
				current_segment.y += 1
			elif current_segment.y > end_segment.y:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.UP
				current_segment.y -= 1
			if current_segment == end_segment:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.RIGHT
				print("end of generation")
				
				####end generation
		else:#randomly choose segments
			var random = rng.randi_range(1, 100)
			if random <= 30 and direction_stucture_organizer[current_segment.x][current_segment.y-1].m_direction == GeneratorSegment.avalaible_directions.NONE:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.UP
				current_segment.y -= 1
			elif random > 30 and random <= 60 and direction_stucture_organizer[current_segment.x][current_segment.y+1].m_direction == GeneratorSegment.avalaible_directions.NONE:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.DOWN
				current_segment.y += 1
			elif direction_stucture_organizer[current_segment.x+1][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.NONE:
					direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.RIGHT
					current_segment.x += 1
			else:
				print("error4")
					
		pass
		
		
		
	# segments are fully generated
	for y in range(segment_count_y):
		for x in range(segment_count_x):
			if direction_stucture_organizer[x][y].m_direction == GeneratorSegment.avalaible_directions.UP:
				printraw("[  UP ]")
			elif direction_stucture_organizer[x][y].m_direction == GeneratorSegment.avalaible_directions.DOWN:
				printraw("[ DOWN]")
			elif direction_stucture_organizer[x][y].m_direction == GeneratorSegment.avalaible_directions.RIGHT:
				printraw("[RIGHT]")
			elif direction_stucture_organizer[x][y].m_direction == GeneratorSegment.avalaible_directions.LEFT:
				printraw("[ LEFT]")
			elif direction_stucture_organizer[x][y].m_direction == GeneratorSegment.avalaible_directions.NONE:
				printraw("[     ]")
		print()
	current_segment = Vector2(0, segment_count_y - floor((start_height / segment_size.y)) -1)
	print(current_segment)
	
	end_segment =  Vector2(segment_count_x-1, segment_count_y - floor((end_height / segment_size.y)) - 1)
	print(end_segment)
	terrain_curve.add_point(Vector2(current_segment.x*segment_size.x+segment_size.x,-(start_height)),Vector2(0,0),Vector2(0,0))
	current_segment.x += 1
	# TODO drawing points according to segments
	while(current_segment != end_segment):
		if direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.RIGHT:
			terrain_curve.add_point(Vector2(current_segment.x*segment_size.x+segment_size.x,-(current_segment.y*segment_size.y+(segment_size.y / 2))),  Vector2(current_segment.x*segment_size.x+segment_size.x,-(current_segment.y*segment_size.y+(segment_size.y / 2))) - Vector2(0, current_segment.y * segment_size.y + segment_size.y),Vector2(0,0))
			current_segment.x += 1
		elif direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.LEFT:
			terrain_curve.add_point(Vector2(current_segment.x*segment_size.x, -(current_segment.y*segment_size.y + (segment_size.y / 2))),Vector2(0,0),Vector2(0,0))
			current_segment.x -= 1
		elif direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.UP:
			terrain_curve.add_point(Vector2(current_segment.x*segment_size.x + (segment_size.x / 2), -(current_segment.y * segment_size.y+segment_size.y)),Vector2(0,0),Vector2(0,0))
			current_segment.y -= 1
		elif direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.DOWN:
			terrain_curve.add_point(Vector2(current_segment.x*segment_size.x + (segment_size.x / 2), -(current_segment.y * segment_size.y)),Vector2(0,0),Vector2(0,0))
			current_segment.y += 1
		if current_segment == end_segment:
			terrain_curve.add_point(Vector2(current_segment.x*segment_size.x+segment_size.x,-(end_height)),Vector2(0,0),Vector2(0,0))
		pass
	#points added (fucking finally :-)
	
	terrain_curve.add_point(Vector2(current_segment.x*segment_size.x+segment_size.x,0),Vector2(0,0),Vector2(0,0))
	
	
	
	
	#clockwise
	#terrain_curve.add_point(segment_size,Vector2(0,0),Vector2(0,0))
	$Polygon2D.set("polygon", terrain_curve.tessellate())
	$StaticBody2D/CollisionPolygon2D.set("polygon", terrain_curve.tessellate())
	print($Polygon2D.polygon)
	$Polygon2D.draw = true
	
	length = segment_count_x * segment_size.x - segment_size.x
	pass
	
#var points = [Vector2(0, 0), Vector2(100, 1450), Vector2(200, 1450), Vector2(300, 1450),
# Vector2(400, 1450), Vector2(450, 1400), Vector2(500, 1550), Vector2(550, 1600), Vector2(550, 1500),
# Vector2(550, 1400), Vector2(600, 1250), Vector2(700, 1250), Vector2(800, 1250), Vector2(900, 1250),
# Vector2(1000, 1250), Vector2(1050, 1300), Vector2(1100, 1150), Vector2(1150, 1100), Vector2(1150, 1200),
# Vector2(1200, 1350), Vector2(1250, 1400), 
#Vector2(1300, 1250), Vector2(1400, 1250), Vector2(1450, 1300), Vector2(1500, 1150), Vector2(1550, 1100), Vector2(1550, 1200), Vector2(1500, 0)]



func _on_Button_pressed():
	generate_terrain_v5(test_seed, 400, 400, 32, 12, Vector2(100,100))
	pass # Replace with function body.


func _on_HSlider_value_changed(value):
	messyness = value
	pass # Replace with function body.


func _on_HSlider2_value_changed(value):
	terrain_size.y = value
	pass # Replace with function body.


func _on_HSlider3_value_changed(value):
	terrain_size.x = value
	pass # Replace with function body.



func _on_HSlider4_value_changed(value):
	test_seed = value
	pass # Replace with function body.
