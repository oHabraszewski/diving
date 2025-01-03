extends Node2D

signal generate_new_terrain()
signal generate_terrain_that_was_before()
signal chest_opened(id)
signal bb_exited()
signal bb_entered()
signal b_explode()

export(int) var segment_count_x = 20 #minimum 10
export(int) var segment_count_y = 10 #minimum 10
export(Vector2) var segment_size = Vector2(100, 100) #minimum 100x100
export(int) var generation_seed = 0 
export(int) var index
export(int) var end_height = -1
export(bool) var show_segments = true
export(Dictionary) var objects = {"chests":[]}
var generated_runned = false
export(int) var chunk_id 


var counter = 0



var rng = RandomNumberGenerator.new()

enum Direction {RIGHT = 0, LEFT = 1, UP = 2, DOWN = 3, NONE = 4, SOLID_GROUND = 6}
#var segments = []
func print_segments(segments, current_segment = null,starting_segment = null):
	var line_to_print = "        X: "
	
	for i in range(segments.size()):
		line_to_print += "%3d" % i
		line_to_print += "   "
	print(line_to_print)
	for j in range(segments[0].size()-1, -1, -1):
		line_to_print = ""
		line_to_print += "Y:"
		line_to_print += "%3d" % j
		line_to_print += "   "
		for i in range(0, segments.size()):
			var what_is_in_that_segment = ""
			if segments[i][j] == 0:
				what_is_in_that_segment = "RIGHT"
			elif segments[i][j] == 1:
				what_is_in_that_segment = "LEFT"
			elif segments[i][j] == 2:
				what_is_in_that_segment = "UP"
			elif segments[i][j] == 3:
				what_is_in_that_segment = "DOWN"
			elif segments[i][j] == 4:
				what_is_in_that_segment = "NONE"
			elif segments[i][j] == 6:
				what_is_in_that_segment = "GND"
			if not starting_segment == null and starting_segment.x == i and starting_segment.y == j:
				line_to_print += "["
				line_to_print += "%5s" % what_is_in_that_segment
			elif not current_segment == null and current_segment.x == i and current_segment.y == j:
				line_to_print += ">"
				line_to_print += "%5s" % what_is_in_that_segment
			else:
				line_to_print += "%6s" % what_is_in_that_segment
		print(line_to_print)
	pass
func reset_segments():
	var segments_to_reset = []
	segments_to_reset.clear()
	for i in range(segment_count_x):
		segments_to_reset.append([])
		for j in range(segment_count_y):
			segments_to_reset[i].append([])
			segments_to_reset[i][j] = Direction.NONE
	return segments_to_reset
	

static func deep_copy(v):
	var t = typeof(v)
	if t == TYPE_DICTIONARY:
		var d = {}
		for k in v:
			d[k] = deep_copy(v[k])
		return d
	elif t == TYPE_ARRAY:
		var d = []
		d.resize(len(v))
		for i in range(len(v)):
			d[i] = deep_copy(v[i])
		return d
	elif t == TYPE_OBJECT:
		if v.has_method("duplicate"):
			return v.duplicate()
		else:
			print("Found an object, but I don't know how to copy it!")
			return v
	else:
		return v

#func check_if_current_segment_is_able_to_move_foreward(max_x_value_in_current_segment, current_segment, segments, checked_direction):
#	var simulated_segments = deep_copy(segments)
#	var simulated_current_segment = deep_copy(current_segment)
#	if checked_direction == Direction.RIGHT:
#		if simulated_segments[current_segment.x + 1][current_segment.y] == Direction.NONE:
#			simulated_segments[current_segment.x + 1][current_segment.y] = Direction.RIGHT
#			simulated_current_segment.x += 1
#		else:
#			return false
#	if checked_direction == Direction.LEFT:
#		if simulated_segments[current_segment.x - 1][current_segment.y] == Direction.NONE:
#			simulated_segments[current_segment.x - 1][current_segment.y] = Direction.LEFT
#			simulated_current_segment.x -= 1
#		else:
#			return false
#	if checked_direction == Direction.UP:
#		if simulated_segments[current_segment.x][current_segment.y - 1] == Direction.NONE:
#			simulated_segments[current_segment.x][current_segment.y - 1] = Direction.UP
#			simulated_current_segment.y -= 1
#		else:
#			return false
#	if checked_direction == Direction.DOWN:
#		if simulated_segments[current_segment.x][current_segment.y + 1] == Direction.NONE:
#			simulated_segments[current_segment.x][current_segment.y + 1] = Direction.DOWN
#			simulated_current_segment.y += 1
#		else:
#			return false
##	print_segments(simulated_segments, simulated_current_segment)
#
##	TODO: sprawdzenie czy po wybraniu tego kierunku mozemy dalej isc!!!!
#	var is_able_to_move_foreward = true
#	var target_segment = Vector2(max_x_value_in_current_segment, simulated_current_segment.y)
#
#	for i in range(simulated_current_segment.x, target_segment.x):
#		if not simulated_segments[i][target_segment.y] == Direction.NONE:
#			is_able_to_move_foreward = false
#			var is_able_to_move_in_this_fucking_loop = true
#			for j in range(simulated_current_segment.x, target_segment.x):
#				if not simulated_segments[j][target_segment.y-1] == Direction.NONE:
#					is_able_to_move_in_this_fucking_loop = false
#			for j in range(simulated_current_segment.x, target_segment.x):
#				if not simulated_segments[j][target_segment.y+1] == Direction.NONE:
#					is_able_to_move_in_this_fucking_loop = false
#			if is_able_to_move_in_this_fucking_loop == true:
#				is_able_to_move_foreward = true
#
#	if not is_able_to_move_foreward:
#		print("stuck")
#	return is_able_to_move_foreward
#
	
	
var avalaible_directions = { 
		Direction.DOWN : 33,
		Direction.LEFT : 50,
		Direction.RIGHT : 50,
		Direction.UP : 33 
	}
	
func reset_and_calculate_avalaible_directions(current_segment):
	if current_segment.y < segment_count_y / 10:
		avalaible_directions = { 
		Direction.DOWN : 1,
		Direction.LEFT : 0,
		Direction.RIGHT : 50,
		Direction.UP : 33 
		}
	elif current_segment.y < segment_count_y / 2:
		avalaible_directions = { 
		Direction.DOWN : 33,
		Direction.LEFT : 50,
		Direction.RIGHT : 50,
		Direction.UP : 33 
		}
	elif current_segment.y > segment_count_y - segment_count_y / 10:
		avalaible_directions = { 
		Direction.DOWN : 33,
		Direction.LEFT : 9,
		Direction.RIGHT : 10,
		Direction.UP : 3 
		}
	else:
		avalaible_directions = { 
		Direction.DOWN : 33,
		Direction.LEFT : 50,
		Direction.RIGHT : 50,
		Direction.UP : 33 
		}
func generate_segments(segments: Array, starting_height = 200):
	var current_segment = Vector2(0, floor(starting_height / segment_size.y))# segmant ktory jest na wyskokosci startowej i w 0-wej kolumnie X
	var max_x_value_in_current_segment = 0  # == current_segment.x
	while(not current_segment.x == segment_count_x):
		if max_x_value_in_current_segment < current_segment.x:
			max_x_value_in_current_segment = current_segment.x
		if current_segment.x == 0 or current_segment.x == 1: # pierwsza kolumna
			segments[current_segment.x][current_segment.y] = Direction.RIGHT
			current_segment.x += 1 # przesuniecie w prawo
		elif current_segment.y == (segment_count_y - 1): # pierwszy rzad
			segments[current_segment.x][current_segment.y] = Direction.DOWN
			current_segment.y -= 1 # przesuniecie w dol
		elif current_segment.y == 0: # ostatni rzad
			segments[current_segment.x][current_segment.y] = Direction.UP
			current_segment.y += 1 # przesuniecie w gore
		elif current_segment.x ==  (segment_count_x - 1): # ostatnia kolumna
			segments[current_segment.x][current_segment.y] = Direction.RIGHT
			current_segment.x += 1
		else: # losowy wybor
			var max_value = 0
			for i in avalaible_directions.keys():
				max_value += avalaible_directions[i]
			
			var random = rng.randi_range(1, max_value)
			var direction_in_question = Direction.NONE
			if random > 0 and random <= avalaible_directions[Direction.DOWN]:
				direction_in_question = Direction.DOWN
			if random > avalaible_directions[Direction.DOWN] and random <= avalaible_directions[Direction.DOWN] + avalaible_directions[Direction.UP]:
				direction_in_question = Direction.UP
			if random > avalaible_directions[Direction.DOWN] + avalaible_directions[Direction.UP]  and random <= avalaible_directions[Direction.DOWN] + avalaible_directions[Direction.UP] + avalaible_directions[Direction.RIGHT]:
				direction_in_question = Direction.RIGHT
			if random > avalaible_directions[Direction.DOWN] + avalaible_directions[Direction.UP] + avalaible_directions[Direction.RIGHT]  and random <= avalaible_directions[Direction.DOWN] + avalaible_directions[Direction.UP] + avalaible_directions[Direction.RIGHT] + avalaible_directions[Direction.LEFT]:
				direction_in_question = Direction.LEFT
				
#			print(direction_in_question, "  << Direction {RIGHT = 0, LEFT = 1, UP = 2, DOWN = 3, NONE = 4}")
#			print_segments(segments, current_segment)
			if direction_in_question == Direction.RIGHT: # go right
				if segments[current_segment.x + 1][current_segment.y] == Direction.NONE:
					segments[current_segment.x][current_segment.y] = Direction.RIGHT
					current_segment.x += 1
					reset_and_calculate_avalaible_directions(current_segment)
				else:
					avalaible_directions[Direction.RIGHT] = 0
			elif direction_in_question == Direction.UP: # go up
				if segments[current_segment.x][current_segment.y + 1] == Direction.NONE: 
					segments[current_segment.x][current_segment.y] = Direction.UP
					current_segment.y += 1
					reset_and_calculate_avalaible_directions(current_segment)
				else:
					avalaible_directions[Direction.UP] = 0
					
			elif direction_in_question == Direction.DOWN and segments[current_segment.x][current_segment.y - 1] == Direction.NONE: # go down
				if segments[current_segment.x][current_segment.y - 1] == Direction.NONE:
					segments[current_segment.x][current_segment.y] = Direction.DOWN
					current_segment.y -= 1
					reset_and_calculate_avalaible_directions(current_segment)
				else:
					avalaible_directions[Direction.DOWN] = 0
			elif direction_in_question == Direction.LEFT: # go left
				if segments[current_segment.x - 1][current_segment.y] == Direction.NONE:
					segments[current_segment.x][current_segment.y] = Direction.LEFT
					current_segment.x -= 1
					reset_and_calculate_avalaible_directions(current_segment)
				else:
					avalaible_directions[Direction.LEFT] = 0
			elif (not segments[current_segment.x - 1][current_segment.y] == Direction.NONE) and (not segments[current_segment.x + 1][current_segment.y] == Direction.NONE) and (not segments[current_segment.x][current_segment.y + 1] == Direction.NONE) and (not segments[current_segment.x][current_segment.y - 1] == Direction.NONE):
				while (not segments[current_segment.x - 1][current_segment.y] == Direction.NONE) and (not segments[current_segment.x + 1][current_segment.y] == Direction.NONE) and (not segments[current_segment.x][current_segment.y + 1] == Direction.NONE) and (not segments[current_segment.x][current_segment.y - 1] == Direction.NONE):
					segments[current_segment.x][current_segment.y] = Direction.RIGHT
					current_segment.x += 1
					reset_and_calculate_avalaible_directions(current_segment)
	for i in range(segment_count_x): # Usatawienie pierwszego rzędu i pierwszej kolumny na NONE
		segments[i][0] = Direction.NONE
		segments[i][segment_count_y - 1] = Direction.NONE

	#
	#           =======================
	#
	# THIS IS SETTING SOLID GROUND BLOCKS (KINDA IMPORTANT STUFF)
	#
	#           =======================
	#
	for j in range(segment_count_y):
		if not segments[0][j] == Direction.NONE:
			current_segment = Vector2(0, j)
	var not_garbage_segments = []
	not_garbage_segments.append(Vector2(current_segment.x, current_segment.y))
	while current_segment.x < segment_count_x:
		if segments[current_segment.x][current_segment.y] == Direction.RIGHT:
			current_segment.x += 1
			not_garbage_segments.append(Vector2(current_segment.x, current_segment.y))
		elif segments[current_segment.x][current_segment.y] == Direction.LEFT:
			current_segment.x -= 1
			not_garbage_segments.append(Vector2(current_segment.x, current_segment.y))
		elif segments[current_segment.x][current_segment.y] == Direction.UP:
			current_segment.y += 1
			not_garbage_segments.append(Vector2(current_segment.x, current_segment.y))
		elif segments[current_segment.x][current_segment.y] == Direction.DOWN:
			current_segment.y -= 1
			not_garbage_segments.append(Vector2(current_segment.x, current_segment.y))
		
	for i in range(segments.size()):
		for j in range(segments[i].size()):
			if not not_garbage_segments.has(Vector2(i,j)):
				segments[i][j] = Direction.NONE
	
	for i in range(segments.size()):
		segments[i][0] = Direction.SOLID_GROUND

	var ground = false
	### na razie do zakomentowania ale moze sie jeszcze przydac
	if false:
		while not ground:
			ground = true
			for i in range(segments.size()-1):
				for j in range(segments[i].size()-1):
					if segments[i+1][j] == Direction.SOLID_GROUND or segments[i-1][j] == Direction.SOLID_GROUND or segments[i][j+1] == Direction.SOLID_GROUND or segments[i][j-1] == Direction.SOLID_GROUND:
						if segments[i][j] == Direction.NONE:
							segments[i][j] = Direction.SOLID_GROUND
							ground = false
	return segments
	
	
func calculate_final_height(segments):
	if generated_runned == false:
		print("ERROR: run generate before calculating final height ")
	var final_height
	for j in range(segment_count_y):
		if not segments[segment_count_x - 1][j] == Direction.NONE:
			final_height = j * segment_size.y + (segment_size.y / 2)
	return final_height
	
	
	
func create_curve_based_on_segments(segments: Array): 
	var curve = Curve2D.new()
#	Wierzcholki beda definiowane zgodnie z ruchem wskazowek zegara.
	curve.add_point(Vector2(0, 0)) # pierwszy wierzcholek
	var current_segment
	for j in range(segment_count_y):
		if not segments[0][j] == Direction.NONE:
			curve.add_point(Vector2(0, j * segment_size.y)) # wierzcholek na wyskokosci startowej
			current_segment = Vector2(0, j)
#	print(current_segment)
	var last_segment = Direction.NONE # zmienna wykorzystywana do wykrywania zmian kierunku
	var control_point = Vector2(rng.randf_range(-segment_size.x, 0), rng.randf_range(-(segment_size.y / 2), segment_size.y / 2)) # zmienna ustawiana jako punkt kontolny
	
	# drugi wierzcholek, ten ktory ma byc na wysokosci startowej
	curve.add_point(Vector2(current_segment.x * segment_size.x, current_segment.y * segment_size.y), Vector2(0, 0), -control_point)
	last_segment = Direction.RIGHT
	current_segment.x += 1
	
	
	$Polygon2DKrztaltTerenu.red_p_t_d = []
	$Polygon2DKrztaltTerenu.points_to_draw = []
	control_point = Vector2(0, 0)
	
	
	var half_segment_size = Vector2(segment_size.x / 2-5, segment_size.y / 2-5)
	var second_variation = 5
	while(current_segment.x < segment_count_x):
		control_point = Vector2(rng.randf_range(-(segment_size.x / 2), segment_size.x / 2), rng.randf_range(-(segment_size.y / 2), segment_size.y / 2))
		if segments[current_segment.x][current_segment.y] == Direction.RIGHT:
			if last_segment == Direction.DOWN: # and (control_point.x > 0 or control_point.y < 0):
#				control_point = Vector2(-50,50)
				control_point = Vector2(rng.randf_range(-(half_segment_size.x), -second_variation), rng.randf_range(second_variation, half_segment_size.y))
			elif last_segment == Direction.UP: #and (control_point.x > 0 or control_point.y > 0):
#				control_point = Vector2(-50,-50)
				control_point = Vector2(rng.randf_range(-(half_segment_size.x), -second_variation), rng.randf_range(-(half_segment_size.y), -second_variation))
			elif control_point.x > 0:
				control_point.x = -control_point.x
			last_segment = Direction.RIGHT
			
			
		elif segments[current_segment.x][current_segment.y] == Direction.LEFT:
			if last_segment == Direction.DOWN: #and (control_point.x < 0 or control_point.y > 0):
#				control_point = Vector2(50,-50)
				control_point = Vector2(rng.randf_range(second_variation, half_segment_size.x), rng.randf_range((half_segment_size.y), second_variation))
			elif last_segment == Direction.UP: #and (control_point.x < 0 or control_point.y < 0):
#				control_point = Vector2(50,50)
				control_point = Vector2(rng.randf_range(second_variation, half_segment_size.x), rng.randf_range(second_variation, half_segment_size.y))
			elif control_point.x < 0:
				control_point.x = -control_point.x
			last_segment = Direction.LEFT
			
		elif segments[current_segment.x][current_segment.y] == Direction.UP:
			if last_segment == Direction.LEFT: # and (control_point.x < 0 or control_point.y > 0):
#				control_point = Vector2(-50,-50)
				control_point = Vector2(rng.randf_range((half_segment_size.x), second_variation), rng.randf_range(-(half_segment_size.y), -second_variation))
			elif last_segment == Direction.RIGHT: # and (control_point.x > 0 or control_point.y > 0):
#				control_point = Vector2(50,-50)
				control_point = Vector2(rng.randf_range(second_variation, half_segment_size.x), rng.randf_range(-(half_segment_size.y), -second_variation))
			elif control_point.y > 0:
				control_point.y = -control_point.y
			last_segment = Direction.UP
			
		elif segments[current_segment.x][current_segment.y] == Direction.DOWN:
			if last_segment == Direction.LEFT: # and (control_point.x < 0 or control_point.y < 0):
#				control_point = Vector2(50,50)
				control_point = Vector2(rng.randf_range(second_variation, half_segment_size.x), rng.randf_range(second_variation, half_segment_size.y))
			elif last_segment == Direction.RIGHT: # and (control_point.x > 0 or control_point.y < 0):
#				control_point = Vector2(-50,50)
				control_point = Vector2(rng.randf_range(-(half_segment_size.x), -second_variation), rng.randf_range(second_variation, half_segment_size.y))
			elif control_point.y < 0:
				control_point.y = -control_point.y
			last_segment = Direction.DOWN

		
		
		curve.add_point(Vector2(current_segment.x * segment_size.x, current_segment.y * segment_size.y), control_point, -control_point)
		$Polygon2DKrztaltTerenu.red_p_t_d.append(control_point + Vector2(current_segment.x * segment_size.x, current_segment.y * segment_size.y))
		#$Polygon2DKrztaltTerenu.red_p_t_d.append(-control_point + Vector2(current_segment.x * segment_size.x, current_segment.y * segment_size.y))
		$Polygon2DKrztaltTerenu.points_to_draw.append(Vector2(current_segment.x * segment_size.x, current_segment.y * segment_size.y))
		
		#przesuniecie
		if segments[current_segment.x][current_segment.y] == Direction.RIGHT:
			current_segment.x += 1
		elif segments[current_segment.x][current_segment.y] == Direction.LEFT:
			current_segment.x -= 1
		elif segments[current_segment.x][current_segment.y] == Direction.UP:
			current_segment.y += 1
		elif segments[current_segment.x][current_segment.y] == Direction.DOWN:
			current_segment.y -= 1
		
		pass
#		to tu bylo zamiast tego ponizej, jakby sie mielo przydaccurve.add_point(Vector2(segment_count_x * segment_size.x + (segment_size.x / 2), current_segment.y * segment_size.y + (segment_size.y / 2)))
	curve.add_point(Vector2(segment_count_x * segment_size.x + (segment_size.x / 2), current_segment.y * segment_size.y )) # przedostatni wierzcholek ten po prawej stronie
	curve.add_point(Vector2(segment_count_x * segment_size.x + (segment_size.x / 2), 0)) # ostatni wierzcholek ten w prawym dolnym rogu (po flip Y)
	return curve
	
	
	
func generate_objects(segments): # like seaweed, sharks etc.
#	print("CHUNK_ID= ", chunk_id)
	var chest_count = 0
	var current_segment
	var coral   = preload("res://assets/koralowiec.png")
	var shell   = preload("res://assets/muszla.png")
	var shell2   = preload("res://assets/muszla2.png")
	var seaweed = preload("res://elements/wodorosty/wodorost.tscn")
	var chest   = preload("res://elements/chest/chest.tscn")
	var bubbles = preload("res://elements/bubbles/bubbles.tscn")
	var bomb = preload("res://elements/bomb/Bomb.tscn")
	for j in range(segment_count_y):
		if segments[0][j] == Direction.RIGHT:
			current_segment = Vector2(0, j)
	current_segment.x += 1
	while current_segment.x < segment_count_x:
#		print(segments[current_segment.x][current_segment.y])
		if segments[current_segment.x][current_segment.y + 1] == Direction.NONE and (segments[current_segment.x][current_segment.y] == Direction.RIGHT):
			var rand_number = rng.randi_range(1, 100)
			if rand_number < 26:
				var this_sw = seaweed.instance()
				this_sw.scale.x += (randi() % 5 - 1) * 0.1
				this_sw.scale.y += (randi() % 3) * 0.1
				this_sw.position = Vector2(current_segment.x * segment_size.x+50,-(current_segment.y * segment_size.y)-30+50)
				$SegmentsDraw.add_child(this_sw)
			elif rand_number < 39:
				var this_crl = Sprite.new()
				this_crl.texture = coral
				this_crl.position = Vector2(current_segment.x * segment_size.x+50,-(current_segment.y * segment_size.y)-65+50)
				if randi() % 2 == 0:
					this_crl.flip_h = true
				this_crl.modulate = Color(rand_range(40, 255) / 255, rand_range(40, 255) / 255, rand_range(40, 255) / 255)
				$SegmentsDraw.add_child(this_crl)
			elif rand_number < 41:
				var this_sh = Sprite.new()
				this_sh.texture = shell2
				this_sh.position = Vector2(current_segment.x * segment_size.x+50,-(current_segment.y * segment_size.y)-10+50)
				this_sh.rotation_degrees = randi() % 40 - 20
				if randi() % 2 == 0:
					this_sh.flip_h = true
				this_sh.modulate = Color(rand_range(40, 235) / 255, rand_range(40, 235) / 255, rand_range(40, 235) / 255)
				$SegmentsDraw.add_child(this_sh)
			elif rand_number < 46:
				var this_sh2 = Sprite.new()
				this_sh2.texture = shell
				this_sh2.position = Vector2(current_segment.x * segment_size.x+50,-(current_segment.y * segment_size.y)+50)
				if randi() % 2 == 0:
					this_sh2.flip_h = true
				$SegmentsDraw.add_child(this_sh2)
			elif rand_number < 55:
				var this_bb = bubbles.instance()
				this_bb.position = Vector2(current_segment.x * segment_size.x+50,-(current_segment.y * segment_size.y)-20+50)
				this_bb.connect("bbenter", self, "bb_pass_enter")
				this_bb.connect("bbexit", self, "bb_pass_exit")
				$SegmentsDraw.add_child(this_bb)
			elif rand_number < 69 and current_segment.y < 2:
				var this_b = bomb.instance()
				this_b.position = Vector2(current_segment.x * segment_size.x+50,-(current_segment.y * segment_size.y)+50)
				this_b.connect("explode", self, "b_pass_explode")
				$SegmentsDraw.add_child(this_b)
			elif rand_number < 71:
				
				var this_ch = chest.instance()
				chest_count += 1
				
				
				if objects["chests"] != []:
					if objects["chests"].has(chest_count):
						this_ch.opened = true
#						print("skrzynia juz istnieje")
				this_ch.chest_id = chest_count
				this_ch.rotate(deg2rad(rng.randf_range(-5.0,5.0)))
				this_ch.position = Vector2(current_segment.x * segment_size.x+50,-(current_segment.y * segment_size.y)+5+50)
				this_ch.connect("opened", self,"signal_interpreter")
#				print("==CHEST===")
#				print(this_ch.position, ", ", this_ch.chest_id, current_segment)
				$SegmentsDraw.add_child(this_ch)
				
		if segments[current_segment.x][current_segment.y] == Direction.RIGHT:
			current_segment.x += 1
		elif segments[current_segment.x][current_segment.y] == Direction.LEFT:
			current_segment.x -= 1
		elif segments[current_segment.x][current_segment.y] == Direction.UP:
			current_segment.y += 1
		elif segments[current_segment.x][current_segment.y] == Direction.DOWN:
			current_segment.y -= 1
		
	pass
	
func _ready():
	pass

func minus_index_flip(idx: int):
	index = idx
	if index < 0:
		$Polygon2D.position.x -= segment_size.x * segment_count_x + (segment_size.x / 2)
		$Polygon2DKrztaltTerenu.position.x -= segment_size.x * segment_count_x + (segment_size.x / 2)
		$StaticBody2DHitboxTerenu.position.x -= segment_size.x * segment_count_x + (segment_size.x / 2)
		$SegmentsDraw.position.x -= segment_size.x * segment_count_x + (segment_size.x / 2) 
#		$SegmentsDraw.position.y += segment_size.y / 2
#		$SegmentsDraw.position.x += segment_size.x / 2
		
		self.scale.x = -1 #obracanie chunka terenu
	pass





func generate(starting_height):
	rng.seed = generation_seed
	
	# jeśli dostanie takie samo generation seed i takie samo start height powinno generować ten sam teren
	var segments
	segments = reset_segments()
	segments = generate_segments(segments, starting_height)
	generated_runned = true
	var final_height = calculate_final_height(segments)
	generate_objects(segments)
#	print("calculated height is: ", final_height)
#	print_segments(segments, Vector2(13,2), Vector2(0, floor(starting_height / segment_size.y)))
	var tollerance = 5
	if OS.get_name() == "Android":
		tollerance = 25
	if OS.get_name() == "HTML5":
		tollerance = 20
	$Polygon2DKrztaltTerenu.polygon = create_curve_based_on_segments(segments).tessellate(5, tollerance)
	$StaticBody2DHitboxTerenu/CollisionPolygon2D.polygon = $Polygon2DKrztaltTerenu.polygon
	if show_segments:
		$SegmentsDraw.show_segemnts(segments)
	return final_height
#
# ______   _______         _______  _______  _______  ______  _________ _______          _________ _______  _ 
#(  __  \ (  ___  )       / ___   )(  ____ )(  ___  )(  ___ \ \__   __/(  ____ \( (    /|\__   __/ (  ___  )( )
#| (  \  )| (   ) |       \/   )  || (    )|| (   ) || (   ) )   ) (   | (    \/|  \  ( |   ) (    | (   ) || |
#| |   ) || |   | |           /   )| (____)|| |   | || (__/ /    | |   | (__    |   \ | |   | |    | (___) || |
#| |   | || |   | |          /   / |     __)| |   | ||  __ (     | |   |  __)   | (\ \) |   | |    |  ___  || |
#| |   ) || |   | |         /   /  | (\ (   | |   | || (  \ \    | |   | (      | | \   |   | |    | (   ) |(_)
#| (__/  )| (___) |        /   (_/\| ) \ \__| (___) || )___) )___) (___| (____/\| )  \  |___) (___ | )   ( | _ 
#(______/ (_______)       (_______/|/   \__/(_______)|/ \___/ \_______/(_______/|/    )_)\_______/ |/     \|(_)      
func signal_interpreter(id):
	var chid = String(chunk_id) + "." + String(id)
	emit_signal("chest_opened", chid)
	pass
func bb_pass_exit():
	emit_signal("bb_exited")
	pass
func bb_pass_enter():
	emit_signal("bb_entered")
	pass
func b_pass_explode():
	emit_signal("b_explode")
	pass



