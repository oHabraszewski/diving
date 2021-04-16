extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var terrain_chunk = preload("res://elements/terrainv2/TerrainChunk.tscn")
var chunks = {}
var current_chunks = {}
export(int) var generation_seed = 1
export(int) var segment_count_x = 20 #minimum 10
export(int) var segment_count_y = 10 #minimum 10
export(Vector2) var segment_size = Vector2(100, 100) #minimum 100x100



func load_chunks():
	pass
func save_chunks():
	pass
func calculate_seed(index: int):
	var gener_seed = String(index) + String(generation_seed) + "123123123"
	gener_seed = gener_seed.sha256_text()
	return hash(gener_seed)
	
	
func add_chunk(front: bool, generation_seed: int, new_game = false, start_index = 0): #funkcja dodaje chunk z podanym seedem
	var incrementar 
	var instance = terrain_chunk.instance()
	instance.segment_count_x = segment_count_x 
	instance.segment_count_y = segment_count_y 
	instance.segment_size = segment_size
	if new_game: #if new game
		#gdy zaczyna się nowa gra pierwszy chunk jest tworzony tutaj
		current_chunks[start_index] = terrain_chunk.instance()
		current_chunks[start_index].generation_seed = calculate_seed(start_index)
		current_chunks[start_index].segment_count_x = segment_count_x 
		current_chunks[start_index].segment_count_y = segment_count_y 
		current_chunks[start_index].segment_size = segment_size 
		chunks[start_index] = 200
		chunks[start_index - 1] = 200
		chunks[start_index + 1] = current_chunks[start_index].generate(200)
		self.add_child(current_chunks[start_index])
		self.position.y = self.position.y + current_chunks[start_index].segment_size.y * current_chunks[start_index].segment_count_y #ustawianie wysokości
	
	else:        #if not new game
#		print(chunks)
		if front: #ruch garcza w prawo
			instance.position.x = current_chunks[current_chunks.keys().max()].position.x + segment_size.x/2 + segment_size.x * segment_count_x
			incrementar = current_chunks.keys().max()+1
			instance.generation_seed = calculate_seed(incrementar)
			if chunks.keys().has(incrementar) and not chunks.keys().has(incrementar + 1):
				chunks[incrementar + 1] = instance.generate(chunks[incrementar])
			elif chunks.keys().has(incrementar):
				instance.generate(chunks[incrementar])
			else:
				print("ERROR: Corrupted seve or invalod data!")
			
				
				
			if current_chunks.size() == 3:
				current_chunks[current_chunks.keys().min()].queue_free()
				current_chunks.erase(current_chunks.keys().min()) # usuwanie niepotrzebnego chunka
		else: #ruch garcza w lewo
			instance.position = Vector2(current_chunks[current_chunks.keys().min()].position.x - current_chunks[current_chunks.keys().min()].segment_size.x/2 - current_chunks[current_chunks.keys().min()].segment_size.x * current_chunks[current_chunks.keys().min()].segment_count_x, current_chunks[current_chunks.keys().min()].position.y)
			incrementar = current_chunks.keys().min()-1
			instance.generation_seed = calculate_seed(incrementar)
			if chunks.keys().has(incrementar) and not chunks.keys().has(incrementar - 1):
				chunks[incrementar - 1] = instance.generate(chunks[incrementar])
			elif chunks.keys().has(incrementar):
				instance.generate(chunks[incrementar])
			else:
				print("ERROR: Corrupted save file or invalid data!")
			
			if current_chunks.size() == 3:
				current_chunks[current_chunks.keys().max()].queue_free()
				current_chunks.erase(current_chunks.keys().max())# usuwanie niepotrzebnego chunka
		current_chunks[incrementar] = instance
		current_chunks[incrementar].minus_index_flip(incrementar)
		self.add_child(current_chunks[incrementar])
	pass
	
	
func _ready():
#	current_instance = terrain_chunk.instance()
#	current_instance.generate()
#	self.add_child(current_instance)
	
#	[-2][-1][0][1][2][3]
#	[  ][  ][200][ ][ ][ ]
	
	add_chunk(true, 1, true)
	add_chunk(true, 1)
	add_chunk(false, 1)
	$Bounds.recalculate(current_chunks[0].segment_size.y * current_chunks[0].segment_count_y, current_chunks[0].segment_size.x * current_chunks[0].segment_count_x + current_chunks[0].segment_size.x / 2 )
	
	pass 

func print_chunks():
	print(chunks)
	print(current_chunks)
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Bounds_colision_left():
	add_chunk(false, 1)
	$Bounds.move_left(segment_size.x * segment_count_x + segment_size.x / 2)
	pass # Replace with function body.


func _on_Bounds_colision_right():
	add_chunk(true, 1)
	$Bounds.move_right(segment_size.x * segment_count_x + segment_size.x / 2)
	pass # Replace with function body.
