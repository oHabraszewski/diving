extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var terrain_chunk = preload("res://elements/terrainv2/TerrainChunk.tscn")
var chunks = {}
var current_chunks = {}

func load_chunks():
	pass
func save_chunks():
	pass
	
func add_chunk(front: bool, generation_seed: int): #funkcja dodaje chunk z podanym seedem
	print("DBG: ", current_chunks.keys().max()+1)
	var incrementar 
	var instance = terrain_chunk.instance()
	if front:
		instance.position = Vector2(current_chunks[current_chunks.keys().max()].position.x + current_chunks[current_chunks.keys().max()].segment_size.x/2 + current_chunks[current_chunks.keys().max()].segment_size.x * current_chunks[0].segment_count_x, current_chunks[current_chunks.keys().max()].position.y)
		incrementar = current_chunks.keys().max()+1
	else:
		instance.position = Vector2(current_chunks[current_chunks.keys().min()].position.x - current_chunks[current_chunks.keys().min()].segment_size.x/2 - current_chunks[current_chunks.keys().min()].segment_size.x * current_chunks[current_chunks.keys().min()].segment_count_x, current_chunks[0].position.y)
		incrementar = current_chunks.keys().min()-1
	current_chunks[incrementar] = instance
	current_chunks[incrementar].generate()
	self.add_child(current_chunks[incrementar])
	
	pass
	
	
func _ready():
#	current_instance = terrain_chunk.instance()
#	current_instance.generate()
#	self.add_child(current_instance)
	
#	[-2][-1][0][1][2][3]
#	[  ][  ][ ][ ][ ][ ]
	
	#if new game
	current_chunks[0] = terrain_chunk.instance()
	current_chunks[0].generate()
	self.add_child(current_chunks[0])
	self.position.y = self.position.y + current_chunks[0].segment_size.y * current_chunks[0].segment_count_y #ustawianie wysokości
	add_chunk(true, 1)
	add_chunk(false, 1)
	$Bounds.recalculate(current_chunks[0].segment_size.y * current_chunks[0].segment_count_y, current_chunks[0].segment_size.x * current_chunks[0].segment_count_x + current_chunks[0].segment_size.x / 2 )
	
	pass 




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Bounds_colision_left():
	add_chunk(false, 1)
	$Bounds.move_left(current_chunks[0].segment_size.x * current_chunks[0].segment_count_x + current_chunks[0].segment_size.x / 2)
	pass # Replace with function body.


func _on_Bounds_colision_right():
	add_chunk(true, 1)
	$Bounds.move_right(current_chunks[0].segment_size.x * current_chunks[0].segment_count_x + current_chunks[0].segment_size.x / 2)
	pass # Replace with function body.
