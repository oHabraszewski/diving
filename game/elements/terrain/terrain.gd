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



#	1 = last_was_right
#	2 = last_was_left
#	3 = last_was_up
#	4 = last_was_down
#	5 = last_two_were_right
#	6 = last_two_were_left
#	7 = last_two_were_up
#	8 = last_two_were_up
	enum last_segments {LAST_WAS_RIGHT, LAST_WAS_LEFT, LAST_WAS_UP, LAST_WAS_DOWN,
	 LAST_TWO_WERE_RIGHT, LAST_TWO_WERE_LEFT, LAST_TWO_WERE_UP, LAST_TWO_WERE_DOWN}


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(float) var length = 0.0
export(PoolVector2Array) var points_to_draw = []
export(PoolVector2Array) var red_p_t_d = []

signal generated()
signal entered_body()

var terrain_size = Vector2(1000,800)
var test_seed = 1
var messyness = 0

func halt(direction_stucture_organizer, size_x, size_y):
#	for y in range(size_y):
#		for x in range(size_x):
#			if direction_stucture_organizer[x][y].m_direction == GeneratorSegment.avalaible_directions.UP:
#				printraw("[  UP ]")
#			elif direction_stucture_organizer[x][y].m_direction == GeneratorSegment.avalaible_directions.DOWN:
#				printraw("[ DOWN]")
#			elif direction_stucture_organizer[x][y].m_direction == GeneratorSegment.avalaible_directions.RIGHT:
#				printraw("[RIGHT]")
#			elif direction_stucture_organizer[x][y].m_direction == GeneratorSegment.avalaible_directions.LEFT:
#				printraw("[ LEFT]")
#			elif direction_stucture_organizer[x][y].m_direction == GeneratorSegment.avalaible_directions.NONE:
#				printraw("[     ]")
#		print()
	pass


func generate_terrain_v5(generation_seed, start_height = 250, end_height = 250, segment_count_x = 16, segment_count_y = 16, segment_size = Vector2(100, 100)):
#	print("SH  ", start_height)
#	print("EH  ", end_height)
##	end_height = segment_count_y * segment_size.y - end_height
##	start_height = segment_count_y * segment_size.y - start_height
#	print("EHN ", start_height)
#	print("SHN ", end_height)
	
	points_to_draw.resize(0)
	red_p_t_d.resize(0)
	
	
	var last_was_left = false
	
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

	var current_segment = Vector2(0,  floor((start_height / segment_size.y)) -1)
#	print(current_segment)
	
	var end_segment =  Vector2(segment_count_x-1,  floor((end_height / segment_size.y)) - 1)
#	print(end_segment)
	
	var random
	while(current_segment != end_segment):
#		print("end_segment: ", end_segment)
#		print("Current segment  X:", current_segment.x, "    Y:", current_segment.y, "         ")
#		if direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.UP:
#			print("[  UP ]")
#		elif direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.DOWN:
#			print("[ DOWN]")
#		elif direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.RIGHT:
#			print("[RIGHT]")
#		elif direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.LEFT:
#			print("[ LEFT]")
#		elif direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.NONE:
#			print("[     ]")
			
#		if current_segment.x == segment_count_x-1:
#			print("BORDER X!")
#
#		if current_segment.y == segment_count_y-1:
#			print("BORDER Y!")
			
		# jesli 1 kolumna od lewej, to idz w prawo
		if current_segment.x == (segment_count_x - 1) and current_segment.y == (segment_count_y - 1):
			direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.UP
			current_segment.y -= 1
		elif current_segment.x == 0:
#			print("pierwsza kolumna x = 0")#DEV
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
				halt(direction_stucture_organizer, segment_count_x, segment_count_y)
		elif current_segment.y == 0:
#			print("najwyższy wiersz y = 0")#DEV
			if direction_stucture_organizer[current_segment.x][current_segment.y+1].m_direction == GeneratorSegment.avalaible_directions.NONE:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.DOWN
				current_segment.y += 1
			elif direction_stucture_organizer[current_segment.x+1][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.NONE:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.RIGHT
				current_segment.x += 1
			else:
				halt(direction_stucture_organizer, segment_count_x, segment_count_y)
		elif current_segment.y == (segment_count_y - 1):
#			print("najniższy wiersz  y = segment_count_y - 1")#DEV
			if current_segment.x+1 == segment_count_x:
				#if direction_stucture_organizer[current_segment.x][current_segment.y-1].m_direction == GeneratorSegment.avalaible_directions.NONE:
					direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.UP
				#else:
				#	halt(6)
			else:
				random = rng.randi_range(1, 100)
				if random >= 70 and direction_stucture_organizer[current_segment.x+1][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.NONE:
					direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.RIGHT
					current_segment.x += 1
				elif direction_stucture_organizer[current_segment.x][current_segment.y-1].m_direction == GeneratorSegment.avalaible_directions.NONE:
					direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.UP
					current_segment.y -= 1
				else:
					halt(direction_stucture_organizer, segment_count_x, segment_count_y)
		elif current_segment.x == (segment_count_x-1):
#			print("ostatnia kolumna x = segment_count_x-1 powinno schodzić na dol lub isc do gory")#DEV
			if current_segment.y < end_segment.y:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.DOWN
				current_segment.y += 1
			elif current_segment.y > end_segment.y:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.UP
				current_segment.y -= 1
			if current_segment == end_segment:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.RIGHT
				
				####end generation
		else:#randomly choose segments
#			print("element wybierany losowo: ")
			random = rng.randi_range(1, 100)
			if last_was_left:
				random = rng.randi_range(1, 40)
			if random <= 30 and direction_stucture_organizer[current_segment.x][current_segment.y-1].m_direction == GeneratorSegment.avalaible_directions.NONE:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.UP
				current_segment.y -= 1
				last_was_left = false
#				print("wybralem  UP")
			elif random > 40 and random <= 70 and direction_stucture_organizer[current_segment.x][current_segment.y+1].m_direction == GeneratorSegment.avalaible_directions.NONE:
				direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.DOWN
				current_segment.y += 1
				last_was_left = false
#				print("wybralem  DOWN")
			elif random > 70 and random <= 100 and direction_stucture_organizer[current_segment.x+1][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.NONE:
					direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.RIGHT
					current_segment.x += 1
					last_was_left = false
#					print("wybralem  RIGHT")
			elif random > 30 and random <= 40 and direction_stucture_organizer[current_segment.x-1][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.NONE:
				var can_create_cave = true
#				print("sprawdzam LEFT...")
				for i in range(0, current_segment.y, 1):
					if direction_stucture_organizer[current_segment.x][i].m_direction != GeneratorSegment.avalaible_directions.NONE:
						can_create_cave = false
				for i in range(current_segment.x, segment_count_x, 1):
					if direction_stucture_organizer[i][current_segment.y].m_direction != GeneratorSegment.avalaible_directions.NONE:
						can_create_cave = false
				if current_segment.x <= 2: 
					can_create_cave = false
				if can_create_cave:
					direction_stucture_organizer[current_segment.x][current_segment.y].m_direction = GeneratorSegment.avalaible_directions.LEFT
					current_segment.x -= 1
					last_was_left = true
#					print("wybralem  LEFT")
				pass
			else:
				halt(direction_stucture_organizer, segment_count_x, segment_count_y)
					
		pass
		
		
		
	# segments are fully generated
#	for y in range(segment_count_y):
#		for x in range(segment_count_x):
#			if direction_stucture_organizer[x][y].m_direction == GeneratorSegment.avalaible_directions.UP:
#				printraw("[  UP ]")
#			elif direction_stucture_organizer[x][y].m_direction == GeneratorSegment.avalaible_directions.DOWN:
#				printraw("[ DOWN]")
#			elif direction_stucture_organizer[x][y].m_direction == GeneratorSegment.avalaible_directions.RIGHT:
#				printraw("[RIGHT]")
#			elif direction_stucture_organizer[x][y].m_direction == GeneratorSegment.avalaible_directions.LEFT:
#				printraw("[ LEFT]")
#			elif direction_stucture_organizer[x][y].m_direction == GeneratorSegment.avalaible_directions.NONE:
#				printraw("[     ]")
#		print()
	current_segment = Vector2(0,  floor((start_height / segment_size.y)) -1)
#	print(current_segment)
	
	end_segment =  Vector2(segment_count_x-1,  floor((end_height / segment_size.y)) - 1)
#	print(end_segment)
	terrain_curve.add_point(Vector2(current_segment.x*segment_size.x+segment_size.x, start_height),Vector2(0,0),Vector2(0,0))
	current_segment.x += 1
	
	
	var next_vertex_needs_to_be_limited = false
	# TODO sprawdzanie rogó i rysowanie wtedy zgodnie z proporcją
	while(current_segment != end_segment):
		if direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.RIGHT:
			var ctrl_point = Vector2(current_segment.x*segment_size.x+segment_size.x, current_segment.y*segment_size.y+(segment_size.y / 2)) - Vector2(current_segment.x * segment_size.x + rng.randi_range(0, segment_size.x), current_segment.y * segment_size.y + rng.randi_range(0, segment_size.y))
			if segment_count_x >= current_segment.x: #żeby nie wychodziło poza bufor 
				if (direction_stucture_organizer[current_segment.x+1][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.UP or direction_stucture_organizer[current_segment.x+1][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.DOWN) or next_vertex_needs_to_be_limited:
#				[     ][  UP ][     ]
#				[RIGHT][ {UP}][     ]
#				[     ][     ][     ]
#					adsasdadgaasdfassa
#				taki róg mniej wiecej
					ctrl_point = Vector2(current_segment.x*segment_size.x+segment_size.x, current_segment.y*segment_size.y+(segment_size.y / 2)) - Vector2(current_segment.x * segment_size.x + rng.randi_range((segment_size.x / 2), segment_size.x) + (segment_size.x/2), current_segment.y * segment_size.y + rng.randi_range(0, segment_size.y))
					if next_vertex_needs_to_be_limited == true:
						next_vertex_needs_to_be_limited = false
					else:
						next_vertex_needs_to_be_limited = true
#					print("SEGMENT: ", current_segment, " DIRECTION: ", direction_stucture_organizer[current_segment.x][current_segment.y].m_direction, "CTRL_POINT: ", ctrl_point) #DEV
					ctrl_point.x = -ctrl_point.x
					pass
			terrain_curve.add_point(Vector2(current_segment.x*segment_size.x+segment_size.x, current_segment.y*segment_size.y+(segment_size.y / 2)), -ctrl_point,  ctrl_point)
			points_to_draw.append(Vector2(current_segment.x*segment_size.x+segment_size.x, current_segment.y*segment_size.y+(segment_size.y / 2)))#DEV
			red_p_t_d.append(ctrl_point + Vector2(current_segment.x*segment_size.x+segment_size.x, current_segment.y*segment_size.y+(segment_size.y / 2)))#DEV
			red_p_t_d.append((-ctrl_point) + Vector2(current_segment.x*segment_size.x+segment_size.x, current_segment.y*segment_size.y+(segment_size.y / 2)))#DEV
			current_segment.x += 1
		elif direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.LEFT: #tu jeszcze może być problem, tzrba testować
			var ctrl_point = Vector2(current_segment.x*segment_size.x, current_segment.y*segment_size.y + (segment_size.y / 2)) - Vector2(current_segment.x * segment_size.x + rng.randi_range(0, segment_size.x), current_segment.y * segment_size.y + rng.randi_range(0, segment_size.y))
			if current_segment.x > 0: #żeby nie wychodziło poza bufor 
				if (direction_stucture_organizer[current_segment.x-1][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.UP or direction_stucture_organizer[current_segment.x-1][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.DOWN) or next_vertex_needs_to_be_limited:
#				[     ][  UP ][     ]
#				[     ][ {UP}][LEFT ]
#				[     ][     ][     ]
#					
#				taki róg mniej wiecej
					ctrl_point = Vector2(current_segment.x*segment_size.x, current_segment.y*segment_size.y + (segment_size.y / 2)) - Vector2(current_segment.x * segment_size.x + rng.randi_range(0, (segment_size.x / 2)) + (segment_size.x/2), current_segment.y * segment_size.y + rng.randi_range(0, segment_size.y))
					pass
				pass
			terrain_curve.add_point(Vector2(current_segment.x*segment_size.x, current_segment.y*segment_size.y + (segment_size.y / 2)), -ctrl_point, ctrl_point)
			points_to_draw.append(Vector2(current_segment.x*segment_size.x, current_segment.y*segment_size.y + (segment_size.y / 2)))#DEV
			red_p_t_d.append(ctrl_point + Vector2(current_segment.x*segment_size.x, current_segment.y*segment_size.y + (segment_size.y / 2)))
			red_p_t_d.append((-ctrl_point) + Vector2(current_segment.x*segment_size.x, current_segment.y*segment_size.y + (segment_size.y / 2)))
			
			current_segment.x -= 1
		elif direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.DOWN:
			var ctrl_point = Vector2(current_segment.x*segment_size.x + (segment_size.x / 2), current_segment.y * segment_size.y+segment_size.y) - Vector2(current_segment.x * segment_size.x + rng.randi_range(0, segment_size.x), current_segment.y * segment_size.y + rng.randi_range(0, segment_size.y))
			if current_segment.y >= 0: #żeby nie wychodziło poza bufor 
				if (direction_stucture_organizer[current_segment.x][current_segment.y+1].m_direction == GeneratorSegment.avalaible_directions.LEFT or direction_stucture_organizer[current_segment.x][current_segment.y+1].m_direction == GeneratorSegment.avalaible_directions.RIGHT) or next_vertex_needs_to_be_limited:
#				[     ][ DOWN][     ]
#				[     ][ {UP}][LEFT ]
#				[     ][     ][     ]
#					
#				taki róg mniej wiecej
					ctrl_point = Vector2(current_segment.x*segment_size.x + (segment_size.x / 2), current_segment.y * segment_size.y+segment_size.y) - Vector2(current_segment.x * segment_size.x + rng.randi_range(0, segment_size.x), current_segment.y * segment_size.y + rng.randi_range((segment_size.y / 2), segment_size.y))
					pass
				pass
			terrain_curve.add_point(Vector2(current_segment.x*segment_size.x + (segment_size.x / 2), current_segment.y * segment_size.y+segment_size.y), -ctrl_point, ctrl_point)
			points_to_draw.append(Vector2(current_segment.x*segment_size.x + (segment_size.x / 2), current_segment.y * segment_size.y+segment_size.y))#DEV
			red_p_t_d.append(ctrl_point + Vector2(current_segment.x*segment_size.x + (segment_size.x / 2), current_segment.y * segment_size.y+segment_size.y))
			red_p_t_d.append((-ctrl_point) + Vector2(current_segment.x*segment_size.x + (segment_size.x / 2), current_segment.y * segment_size.y+segment_size.y))
			
			
			
			current_segment.y += 1
		elif direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.UP:
			var ctrl_point = Vector2(current_segment.x*segment_size.x + (segment_size.x / 2), current_segment.y * segment_size.y) - Vector2(current_segment.x * segment_size.x + rng.randi_range(0, segment_size.x), current_segment.y * segment_size.y + rng.randi_range(0, segment_size.y))
			if current_segment.y >= 0: #żeby nie wychodziło poza bufor 
				if (direction_stucture_organizer[current_segment.x][current_segment.y-1].m_direction == GeneratorSegment.avalaible_directions.LEFT or direction_stucture_organizer[current_segment.x][current_segment.y-1].m_direction == GeneratorSegment.avalaible_directions.RIGHT) or next_vertex_needs_to_be_limited:
#				[     ][     ][     ]
#				[     ][ {UP}][LEFT ]
#				[     ][  UP ][     ]
#					
#				taki róg mniej wiecej
					ctrl_point = Vector2(current_segment.x*segment_size.x + (segment_size.x / 2), current_segment.y * segment_size.y) - Vector2(current_segment.x * segment_size.x + rng.randi_range(0, segment_size.x), current_segment.y * segment_size.y + rng.randi_range(0, (segment_size.y/2)))
					pass
				pass
			
			
			terrain_curve.add_point(Vector2(current_segment.x*segment_size.x + (segment_size.x / 2), current_segment.y * segment_size.y), -ctrl_point, ctrl_point)
			points_to_draw.append(Vector2(current_segment.x*segment_size.x + (segment_size.x / 2), current_segment.y * segment_size.y)) #DEV
			red_p_t_d.append(ctrl_point + Vector2(current_segment.x*segment_size.x + (segment_size.x / 2), current_segment.y * segment_size.y))
			red_p_t_d.append((-ctrl_point) + Vector2(current_segment.x*segment_size.x + (segment_size.x / 2), current_segment.y * segment_size.y))
			
			current_segment.y -= 1
		if current_segment == end_segment:
			terrain_curve.add_point(Vector2(current_segment.x*segment_size.x + segment_size.x + segment_size.x, end_height), Vector2(0,0), Vector2(0,0))
		pass
	#points added (fucking finally :-)
	
	terrain_curve.add_point(Vector2(current_segment.x*segment_size.x + segment_size.x + segment_size.x,0),Vector2(0,0),Vector2(0,0))
	
	
	## Add seaweed to the world
	current_segment = Vector2(0,  floor((start_height / segment_size.y)) -1)
#	print(current_segment)
	
	end_segment =  Vector2(segment_count_x-1,  floor((end_height / segment_size.y)) - 1)
#	print(end_segment)
	
## Add sharks to the world
## Add seaweed to the world
	var seaweed = preload("res://elements/wodorosty/wodorost.tscn")
	while(current_segment != end_segment):
		if direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.RIGHT:
			if direction_stucture_organizer[current_segment.x+1][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.RIGHT and not current_segment.x == 0:
				var seaweed_instance = seaweed.instance()
				seaweed_instance.position.x = current_segment.x * segment_size.x + segment_size.x
				seaweed_instance.position.y = -(current_segment.y * segment_size.y) - (segment_size.y / 2) - 30 # this "-30" is equal to size of the seaweed image (100px scaled by 0.3)
				seaweed_instance.frame = randi() % 5 
				self.add_child(seaweed_instance)
			current_segment.x += 1
			pass
		elif direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.LEFT:
			current_segment.x -= 1
			pass
		elif direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.UP:
			current_segment.y -= 1
			pass
		elif direction_stucture_organizer[current_segment.x][current_segment.y].m_direction == GeneratorSegment.avalaible_directions.DOWN:
			current_segment.y += 1
			pass
		pass
	
	#clockwise
	#terrain_curve.add_point(segment_size,Vector2(0,0),Vector2(0,0))
	$Polygon2D.set("polygon", terrain_curve.tessellate())
	$StaticBody2D/CollisionPolygon2D.set("polygon", terrain_curve.tessellate())
	$Polygon2D.set("draw", true)
	length = segment_count_x * segment_size.x 
	$Area2D/CollisionShape2D.shape.extents.y = segment_count_y * segment_size.y / 2
	$Area2D/CollisionShape2D.position.x = (segment_count_x * segment_size.x) / 3
	$Area2D/CollisionShape2D.position.y = -(segment_count_y * segment_size.y / 2)
	emit_signal("generated")
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
	pass
	
#var points = [Vector2(0, 0), Vector2(100, 1450), Vector2(200, 1450), Vector2(300, 1450),
# Vector2(400, 1450), Vector2(450, 1400), Vector2(500, 1550), Vector2(550, 1600), Vector2(550, 1500),
# Vector2(550, 1400), Vector2(600, 1250), Vector2(700, 1250), Vector2(800, 1250), Vector2(900, 1250),
# Vector2(1000, 1250), Vector2(1050, 1300), Vector2(1100, 1150), Vector2(1150, 1100), Vector2(1150, 1200),
# Vector2(1200, 1350), Vector2(1250, 1400), 
#Vector2(1300, 1250), Vector2(1400, 1250), Vector2(1450, 1300), Vector2(1500, 1150), Vector2(1550, 1100), Vector2(1550, 1200), Vector2(1500, 0)]

	
	

func _on_HSlider4_value_changed(value):
	test_seed = value
	pass # Replace with function body.



func _on_Area2D_body_entered(body):
	print(body)
	emit_signal("entered_body")
	print(body)
	pass # Replace with function body.
