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
	
func add_chunk(front: bool, generation_seed: int, new_game = false): #funkcja dodaje chunk z podanym seedem
	var incrementar 
	var instance = terrain_chunk.instance()
	instance.generation_seed = generation_seed
	instance.segment_count_x = segment_count_x 
	instance.segment_count_y = segment_count_y 
	instance.segment_size = segment_size 
	if new_game: #if new game
		current_chunks[0] = terrain_chunk.instance()
		current_chunks[0].generation_seed = generation_seed
		current_chunks[0].segment_count_x = segment_count_x 
		current_chunks[0].segment_count_y = segment_count_y 
		current_chunks[0].segment_size = segment_size 
		chunks[0] = current_chunks[0].generate(200)
		self.add_child(current_chunks[0])
		self.position.y = self.position.y + current_chunks[0].segment_size.y * current_chunks[0].segment_count_y #ustawianie wysokości
	else:        #if not new game
		if front:
			instance.position = Vector2(current_chunks[current_chunks.keys().max()].position.x + current_chunks[current_chunks.keys().max()].segment_size.x/2 + current_chunks[current_chunks.keys().max()].segment_size.x * current_chunks[current_chunks.keys().max()].segment_count_x, current_chunks[current_chunks.keys().max()].position.y)
			incrementar = current_chunks.keys().max()+1
			if chunks.has(incrementar):
				instance.generate(chunks[incrementar])
			else:
				chunks[incrementar] = instance.generate(chunks[incrementar-1])
			if current_chunks.size() > 3:
				current_chunks.erase(current_chunks.keys().min()) # usuwanie niepotrzebnego chunka
		else:
			instance.position = Vector2(current_chunks[current_chunks.keys().min()].position.x - current_chunks[current_chunks.keys().min()].segment_size.x/2 - current_chunks[current_chunks.keys().min()].segment_size.x * current_chunks[current_chunks.keys().min()].segment_count_x, current_chunks[current_chunks.keys().min()].position.y)
			incrementar = current_chunks.keys().min()-1
			if chunks.has(incrementar):
				instance.generate(chunks[incrementar])
			else:
				print(instance.generate(chunks[incrementar+1]))
				print(instance.generate(chunks[incrementar+1]))
				chunks[incrementar] = instance.generate(chunks[incrementar+1])
			if current_chunks.size() > 3:
				current_chunks.erase(current_chunks.keys().max())# usuwanie niepotrzebnego chunka
		current_chunks[incrementar] = instance
		self.add_child(current_chunks[incrementar])
	pass
	
	
func _ready():
#	current_instance = terrain_chunk.instance()
#	current_instance.generate()
#	self.add_child(current_instance)
	
#	[-2][-1][0][1][2][3]
#	[  ][  ][ ][ ][ ][ ]
	
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
