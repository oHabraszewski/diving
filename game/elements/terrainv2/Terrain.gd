extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var terrain_chunk = preload("res://elements/terrainv2/TerrainChunk.tscn")
var index = 0 #chunk na ktorym jest gracz aktualnie
var current_instance
var right_instance
var left_instance
# Called when the node enters the scene tree for the first time.
func _ready():
	current_instance = terrain_chunk.instance()
	self.add_child(current_instance)
	
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_left"):
		$"Camera2D".position.x -= 10
	if Input.is_action_pressed("move_right"):
		$"Camera2D".position.x += 10
	if Input.is_action_pressed("move_up"):
		$"Camera2D".position.y -= 10
	if Input.is_action_pressed("move_down"):
		$"Camera2D".position.y += 10
	pass
