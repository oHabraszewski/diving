extends Node2D

signal generate_new_terrain()
signal generate_terrain_that_was_before()


export(int) var segment_count_x = 20 #minimum 10
export(int) var segment_count_y = 10 #minimum 10
export(Vector2) var segment_size = Vector2(100, 100) #minimum 100x100
export(int) var generation_seed = 0 
export(int) var end_height = -1
var rng = RandomNumberGenerator.new()

enum Direction {RIGHT = 0, LEFT = 1, UP = 2, DOWN = 3, NONE = 4}
#var segments = []
func print_segments(segments, current_segment = null,starting_segment = null):
	var line_to_print = "        X: "
	var x_values = range(segment_count_x)
	
	for i in x_values:
		line_to_print += "%3d" % i
		line_to_print += "   "
	print(line_to_print)
	for j in range(0, segment_count_y):
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
func position_areas_correctly(): # Area2D objects used to make new chunks of tarrain
	pass
func generate_segments(segments: Array, starting_height = 200):
	# warunki graniczne w kolejności lewo, prawo, gora, dol, gdy nic nie jest spelnione to wybierz wedlug wag
#	wagi:
#	jeśli wyskosc jest mniejsza niz 10% to:
#			80% do gory
#			20% w prawo
#	jesli wysokosc jest wieksza niz 50% ale mniejsza niz 80%:
#			30% w prawo
#			30% w lewo
#			20% w gore
#			20% w dol
#	jesli wysokosc jest wieksza niz 80% ale mneijsza niz 90% to:
#			40% w lewo
#			40% w prawo
#			10% w gore
#			10% w dol
#	jesli wysokosc jest wieksza niz 90% to:
#			80% w dol
#			20% w prawo
	
	
#	Wyglad tablicy (jak w pamieci i na zrzucie)
	var current_segment = Vector2(0, floor(starting_height / segment_size.y))# segmant ktory jest na wyskokosci startowej i w 0-wej kolumnie X
	
	while(not current_segment.x == segment_count_x):
		#TODO: wyjscie z rogow
		if current_segment.x == 0: # pierwsza kolumna
			segments[current_segment.x][current_segment.y] = Direction.RIGHT
			current_segment.x += 1 # przesuniecie w prawo
		elif current_segment.y == 0: # pierwszy rzad
			segments[current_segment.x][current_segment.y] = Direction.DOWN
			current_segment.y += 1 # przesuniecie w dol
		elif current_segment.y == (segment_count_y - 1): # ostatni rzad
			segments[current_segment.x][current_segment.y] = Direction.UP
			current_segment.y -= 1 # przesuniecie w gore
		elif current_segment.x ==  (segment_count_x - 1): # ostatnia kolumna
			segments[current_segment.x][current_segment.y] = Direction.RIGHT
			current_segment.x += 1
			#ewentualne checki na to czy koniec jest git + wylicznaie wyskosci koncowej
		else: # losowy wybor
			var random = rng.randi_range(1, 100)
			if random > 0  and random <= 33 and segments[current_segment.x + 1][current_segment.y] == Direction.NONE: # go right
				segments[current_segment.x][current_segment.y] = Direction.RIGHT
				current_segment.x += 1
			elif random > 33 and random <= 66 and segments[current_segment.x][current_segment.y - 1] == Direction.NONE: # go up
				segments[current_segment.x][current_segment.y] = Direction.UP
				current_segment.y -= 1
			elif random > 66 and random <= 100 and segments[current_segment.x][current_segment.y + 1] == Direction.NONE: # go down
				segments[current_segment.x][current_segment.y] = Direction.DOWN
				current_segment.y += 1
	for i in range(segment_count_x): # Usatawienie pierwszego rzędu i pierwszej kolumny na NONE
		segments[i][0] = Direction.NONE
		segments[i][segment_count_y - 1] = Direction.NONE
	return segments
func calculate_final_height(segments):
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
	var last_segment = Direction.NONE # zmienna wykorzystywana do wykrywania zmian kierunku
	while(current_segment.x < segment_count_x):
		if segments[current_segment.x][current_segment.y] == Direction.RIGHT:
			if last_segment == Direction.UP:
				pass
			elif last_segment == Direction.DOWN:
				pass
			curve.add_point(Vector2(current_segment.x * segment_size.x, current_segment.y * segment_size.y))
			last_segment = Direction.RIGHT
			current_segment.x += 1
		elif segments[current_segment.x][current_segment.y] == Direction.LEFT:
			curve.add_point(Vector2(current_segment.x * segment_size.x, current_segment.y * segment_size.y))
			last_segment = Direction.LEFT
			current_segment.x -= 1
		elif segments[current_segment.x][current_segment.y] == Direction.UP:
			curve.add_point(Vector2(current_segment.x * segment_size.x, current_segment.y * segment_size.y))
			last_segment = Direction.UP
			current_segment.y -= 1
		elif segments[current_segment.x][current_segment.y] == Direction.DOWN:
			curve.add_point(Vector2(current_segment.x * segment_size.x, current_segment.y * segment_size.y))
			last_segment = Direction.DOWN
			current_segment.y += 1
		pass
	# przedostatni wierzcholek ten po prawej stronie
	curve.add_point(Vector2(segment_count_x * segment_size.x, 0)) # ostatni wierzcholek ten w prawym dolnym rogu (po flip Y)
	return curve
	
func generate_objects(): # like seaweed, sharks etc.
	pass
	
func _ready():
	pass



func _on_Button_pressed():
	var segments
	segments = reset_segments()
	segments = generate_segments(segments, 200)
	print("calculated height is: ", calculate_final_height(segments))
	$Polygon2DKrztaltTerenu.polygon = create_curve_based_on_segments(segments).tessellate()
	print_segments(segments, Vector2(13,2), Vector2(0, floor(200 / segment_size.y)))
	pass # Replace with function body.
