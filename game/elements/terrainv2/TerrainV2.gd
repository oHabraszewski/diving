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
var segments = []
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
func reset_segments(segments_to_reset: Array):
	segments_to_reset.clear()
	for i in range(segment_count_x):
		segments_to_reset.append([])
		for j in range(segment_count_y):
			segments_to_reset[i].append([])
			segments_to_reset[i][j] = Direction.NONE
	pass
func position_areas_correctly(): # Area2D objects used to make new chunks of tarrain
	pass
func generate_segments(segments, starting_height = 200):
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
	
	while(not current_segment.x == (segment_count_x - 1)):
		#TODO: wyjscie z rogow
		if current_segment.x == 0: # pierwsza kolumna
			segments[current_segment.x][current_segment.y] = Direction.RIGHT
			current_segment.x += 1 # przesuniecie w prawo
			pass
		elif current_segment.y == 0: # pierwszy rzad
			segments[current_segment.x][current_segment.y] = Direction.DOWN
			current_segment.y += 1 # przesuniecie w dol
			pass
		elif current_segment.y == (segment_count_y - 1): # ostatni rzad
			segments[current_segment.x][current_segment.y] = Direction.UP
			current_segment.y += 1 # przesuniecie w gore
			pass
		elif current_segment.x ==  (segment_count_x - 1): # ostatnia kolumna
			#ewentualne checki na to czy koniec jest git + wylicznaie wyskosci koncowej
			pass
		else: # losowy wybor
			var random = rng.randi_range(1, 100)
			
			pass
	pass
func calculate_final_height():
	pass
func create_curve_based_on_segments(): 
	pass
func generate_objects(): # like seaweed, sharks etc.
	pass
func _ready():
	pass



func _on_Button_pressed():
	reset_segments(segments)
	generate_segments(segments, 200)
	print_segments(segments, Vector2(13,2), Vector2(0, floor(200 / segment_size.y)))
	pass # Replace with function body.
