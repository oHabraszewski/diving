extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var terrain_chunk = preload("res://elements/terrainv2/TerrainChunk.tscn")
var index = 0 #chunk na ktorym jest gracz aktualnie
var current_instance


# Called when the node enters the scene tree for the first time.
func _ready():
	current_instance = terrain_chunk.instance()
	current_instance.generate()
	self.add_child(current_instance)
	
	
	
	
	#ustawianie wysokości
	self.position.y = self.position.y + current_instance.segment_size.y * current_instance.segment_count_y
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
