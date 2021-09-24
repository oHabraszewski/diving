extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	get_tree().change_scene("res://main.tscn")
	pass # Replace with function body.


func _on_Button2_pressed():
	$TerrainChunk.generation_seed = $SpinBox.value
	$TerrainChunk.rng.seed = $TerrainChunk.generation_seed
	$TerrainChunk.segment_count_y = 30
	# jeśli dostanie takie samo generation seed i takie samo start height powinno generować ten sam teren
	var segments
	segments = $TerrainChunk.reset_segments()
	segments = $TerrainChunk.generate_segments(segments, 200)
	$TerrainChunk.generated_runned = true
	var final_height = $TerrainChunk.calculate_final_height(segments)
	$TerrainChunk.generate_objects()
#	print("calculated height is: ", final_height)
#	print_segments(segments, Vector2(13,2), Vector2(0, floor(starting_height / segment_size.y)))
	$TerrainChunk/Polygon2DKrztaltTerenu.polygon = $TerrainChunk.create_curve_based_on_segments(segments).tessellate()
	$TerrainChunk/StaticBody2DHitboxTerenu/CollisionPolygon2D.polygon = $TerrainChunk/Polygon2DKrztaltTerenu.polygon
#	$TerrainChunk.print_segments(segments)
	$SpinBox.value = $SpinBox.value + 1
	pass # Replace with function body.


func _on_Button3_pressed():
	$TerrainChunk.generation_seed = $SpinBox.value
	$TerrainChunk.rng.seed = $TerrainChunk.generation_seed
	$TerrainChunk.segment_count_y = 30
	# jeśli dostanie takie samo generation seed i takie samo start height powinno generować ten sam teren
	var segments
	segments = $TerrainChunk.reset_segments()
	segments = $TerrainChunk.generate_segments(segments, 200)
	$RichTextLabel.text = print_segments_dbg(segments, Vector2(0,0), $TerrainChunk.segment_count_x, $TerrainChunk.segment_count_y)
#	print($TerrainChunk.segment_count_y - 1, " != ", segments[0].size())
	
	$SpinBox.value = $SpinBox.value + 1
	pass # Replace with function body.
	
	
	

func print_segments_dbg(segments, current_segment = null, segment_count_x = null, segment_count_y = null):
	var output = ""
	var line_to_print = "        X: "
	var x_values = range(segment_count_x)
	
	for i in x_values:
		line_to_print += "%3d" % i
		line_to_print += "   "
#		
	output += line_to_print + "\n"
	for j in range(segment_count_y-1, -1, -1):
		line_to_print = ""
		line_to_print += "Y:"
		line_to_print += "%3d" % j
		line_to_print += "   "
		for i in range(0, segment_count_x):
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
			if not current_segment == null and current_segment.x == i and current_segment.y == j:
				line_to_print += ">"
				line_to_print += "%5s" % what_is_in_that_segment
			else:
				line_to_print += "%6s" % what_is_in_that_segment
#		
		output += line_to_print + "\n"
		$RichTextLabel.text = output
	return output


		
		
		
func modify(text):
	var ccd = deep_copy(text)
	ccd[1] += "123" 
	return ccd
var texte = {1: "dxd", 2: "asd"}
func _on_Button4_pressed():
	# RIGHT = 0, LEFT = 1, UP = 2, DOWN = 3, NONE = 4  
	var test_unit_current_segment = Vector2(4,3)                                                         
	var test_unit_segments = [
	# Y  0  1  2  3  4  5  6  7  8  9    X
		[4, 4, 4, 4, 0, 4, 4, 4, 4, 4], #0
		[4, 4, 4, 4, 0, 4, 4, 4, 4, 4], #1
		[4, 4, 4, 4, 0, 4, 4, 4, 4, 4], #2
		[4, 4, 4, 4, 2, 0, 4, 4, 4, 4], #3
		[4, 4, 4, 4, 4, 0, 4, 4, 4, 4], #4
		[4, 4, 4,  1 , 3, 3, 4, 4, 4, 4], #5
		[4, 4, 4, 4, 4, 4, 4, 4, 4, 4], #6
		[4, 4, 4, 4, 4, 4, 4, 4, 4, 4], #7
		[4, 4, 4, 4, 4, 4, 4, 4, 4, 4], #8
		[4, 4, 4, 4, 4, 4, 4, 4, 4, 4]  #9
	]
	$TerrainChunk.print_segments(test_unit_segments,test_unit_current_segment)
	print($TerrainChunk.check_if_current_segment_is_able_to_move_foreward(5, test_unit_current_segment, test_unit_segments, $TerrainChunk.Direction.DOWN))
#	print($TerrainChunk.check_if_current_segment_is_able_to_move_foreward(max_x_value_in_current_segment, current_segment, segments, direction_in_question))
	pass # Replace with function body.
	
	
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

func _on_Button5_pressed():
	print("test")
	# RIGHT = 0, LEFT = 1, UP = 2, DOWN = 3, NONE = 4  
	var test_unit_current_segment = Vector2(0,5)                                                         
	var test_unit_segments = [
	# Y  0  1  2  3  4  5  6  7  8  9    X
		[4, 4, 4, 4, 4, 4, 4, 4, 4, 4], #0
		[4, 4, 4, 4, 4, 4, 4, 4, 4, 4], #1
		[4, 4, 4, 4, 4, 4, 4, 4, 4, 4], #2
		[4, 4, 4, 4, 4, 4, 4, 4, 4, 4], #3
		[4, 4, 4, 4, 4, 4, 4, 4, 4, 4], #4
		[4, 4, 4, 4, 4, 4, 4, 4, 4, 4], #5
		[4, 4, 4, 4, 4, 4, 4, 4, 4, 4], #6
		[4, 4, 4, 4, 4, 4, 4, 4, 4, 4], #7
		[4, 4, 4, 4, 4, 4, 4, 4, 4, 4], #8
		[4, 4, 4, 4, 4, 4, 4, 4, 4, 4]  #9
	]
	var test_unit_helper_points = []
	test_unit_helper_points.append(Vector2(0, 5)) # starting point
	
	test_unit_helper_points.append(Vector2(1, 3))
	test_unit_helper_points.append(Vector2(2, 2))
	test_unit_helper_points.append(Vector2(3, 8))
	test_unit_helper_points.append(Vector2(4, 4))
	test_unit_helper_points.append(Vector2(6, 5))
#	test_unit_helper_points.append(Vector2(5, 6))
	test_unit_helper_points.append(Vector2(8, 4))
	test_unit_helper_points.append(Vector2(9, 3))
	while(test_unit_helper_points.size() > 0):
#		print(test_unit_helper_points)
		var test_unit_current_helper_point = test_unit_helper_points.pop_front()
		while(test_unit_current_helper_point != test_unit_current_segment):
		#idz gora-dol
			if test_unit_current_segment.y > test_unit_current_helper_point.y:
				test_unit_segments[test_unit_current_segment.x][test_unit_current_segment.y] = 3
				test_unit_current_segment.y -= 1
				pass
			elif test_unit_current_segment.y < test_unit_current_helper_point.y:
				test_unit_segments[test_unit_current_segment.x][test_unit_current_segment.y] = 2
				test_unit_current_segment.y += 1
				pass
			else:
				if test_unit_current_segment.x > test_unit_current_helper_point.x:
					test_unit_segments[test_unit_current_segment.x][test_unit_current_segment.y] = 1
					test_unit_current_segment.x -= 1
				elif test_unit_current_segment.x < test_unit_current_helper_point.x:
					test_unit_segments[test_unit_current_segment.x][test_unit_current_segment.y] = 0
					test_unit_current_segment.x += 1
				test_unit_current_segment.x = test_unit_current_helper_point.x
				pass

#idz w poziomie
#unikaj scian
#
#
			pass
		pass
	$TerrainChunk.print_segments(test_unit_segments,test_unit_current_segment)
	
	pass # Replace with function body.



# =====FOR DEBUGGING ONLY=====
var rng = RandomNumberGenerator.new()
enum Direction {RIGHT = 0, LEFT = 1, UP = 2, DOWN = 3, NONE = 4}
export(int) var segment_count_x = 20 #minimum 10
export(int) var segment_count_y = 10 #minimum 10
export(Vector2) var segment_size = Vector2(100, 100) #minimum 100x100
export(int) var generation_seed = 0 
export(int) var index
export(int) var end_height = -1
var starting_height = 200
var segments = reset_segments()
func reset_segments():
	var segments_to_reset = []
	segments_to_reset.clear()
	for i in range(segment_count_x):
		segments_to_reset.append([])
		for j in range(segment_count_y):
			segments_to_reset[i].append([])
			segments_to_reset[i][j] = Direction.NONE
	return segments_to_reset
func check_if_current_segment_is_able_to_move_foreward(max_x_value_in_current_segment, current_segment, segments, checked_direction):
	var simulated_segments = deep_copy(segments)
	var simulated_current_segment = deep_copy(current_segment)
	if checked_direction == Direction.RIGHT:
		if simulated_segments[current_segment.x + 1][current_segment.y] == Direction.NONE:
			simulated_segments[current_segment.x + 1][current_segment.y] = Direction.RIGHT
			simulated_current_segment.x += 1
		else:
			return false
	if checked_direction == Direction.LEFT:
		if simulated_segments[current_segment.x - 1][current_segment.y] == Direction.NONE:
			simulated_segments[current_segment.x - 1][current_segment.y] = Direction.LEFT
			simulated_current_segment.x -= 1
		else:
			return false
	if checked_direction == Direction.UP:
		if simulated_segments[current_segment.x][current_segment.y - 1] == Direction.NONE:
			simulated_segments[current_segment.x][current_segment.y - 1] = Direction.UP
			simulated_current_segment.y -= 1
		else:
			return false
	if checked_direction == Direction.DOWN:
		if simulated_segments[current_segment.x][current_segment.y + 1] == Direction.NONE:
			simulated_segments[current_segment.x][current_segment.y + 1] = Direction.DOWN
			simulated_current_segment.y += 1
		else:
			return false
	var is_able_to_move_foreward = true
	var target_segment = Vector2(max_x_value_in_current_segment, simulated_current_segment.y)
	for i in range(simulated_current_segment.x, target_segment.x):
		if not simulated_segments[i][target_segment.y] == Direction.NONE:
			is_able_to_move_foreward = false
			var is_able_to_move_in_this_fucking_loop = true
			for j in range(simulated_current_segment.x, target_segment.x):
				if not simulated_segments[j][target_segment.y-1] == Direction.NONE:
					is_able_to_move_in_this_fucking_loop = false
			for j in range(simulated_current_segment.x, target_segment.x):
				if not simulated_segments[j][target_segment.y+1] == Direction.NONE:
					is_able_to_move_in_this_fucking_loop = false
			if is_able_to_move_in_this_fucking_loop == true:
				is_able_to_move_foreward = true
	if not is_able_to_move_foreward:
		print("stuck")
	return is_able_to_move_foreward
	
func _on_Button6_pressed():
	
	var avalaible_directions = { 
		Direction.DOWN : 33,
		Direction.LEFT : 20,
		Direction.RIGHT : 33,
		Direction.UP : 33, 
	}
	var current_segment = Vector2(0, floor(starting_height / segment_size.y))# segmant ktory jest na wyskokosci startowej i w 0-wej kolumnie X
	var max_x_value_in_current_segment = 0  # == current_segment.x
	while(not current_segment.x == segment_count_x):
		if max_x_value_in_current_segment < current_segment.x:
			max_x_value_in_current_segment = current_segment.x
		if current_segment.x == 0: # pierwsza kolumna
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
			#ewentualne checki na to czy koniec jest git + wylicznaie wyskosci koncowej
		else: # losowy wybor
#			print_segments(segments,current_segment)

#			print(avalaible_directions)
			

			
			
			var max_value = 0
			for i in avalaible_directions.keys():
				max_value += avalaible_directions[i]
				
#			print(max_value)
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
			print(direction_in_question)
			if check_if_current_segment_is_able_to_move_foreward(max_x_value_in_current_segment, current_segment, segments, direction_in_question):
#				avalaible_directions[direction_in_question] = 0
#				print("direction_not_avalaible!")
				if direction_in_question == Direction.RIGHT: # go right
					segments[current_segment.x][current_segment.y] = Direction.RIGHT
					current_segment.x += 1
				elif direction_in_question == Direction.UP: # go up
					segments[current_segment.x][current_segment.y] = Direction.UP
					current_segment.y += 1
				elif direction_in_question == Direction.DOWN: # go down
					segments[current_segment.x][current_segment.y] = Direction.DOWN
					current_segment.y -= 1
				elif direction_in_question == Direction.LEFT: # go left
					if current_segment.x > 1 and current_segment.x < segment_count_x - 2 and current_segment.y > 1 and current_segment.y < segment_count_y - 2:
						segments[current_segment.x][current_segment.y] = Direction.LEFT
						current_segment.x -= 1
					else:
						print_debug("ERROR: XD")
				avalaible_directions = {Direction.DOWN : 33, Direction.LEFT : 2000, Direction.RIGHT : 33, Direction.UP : 33}
			else:
				avalaible_directions[direction_in_question] = 0
				print("direction_not_avalaible!")
				#	sprawdz czy da sie gdziekoleik ruszyc
				var can_move = true
				if avalaible_directions.values().max() == 0:
					can_move = false
				if not can_move:
					print_debug("ERROR: NI MA KAJ ISC!!!")
					get_tree().quit(-1)
			
			
				
					
					
	for i in range(segment_count_x): # Usatawienie pierwszego rzędu i pierwszej kolumny na NONE
		segments[i][0] = Direction.NONE
		segments[i][segment_count_y - 1] = Direction.NONE
	pass # Replace with function body.
