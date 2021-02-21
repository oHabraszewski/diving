extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var terrain = preload("res://elements/terrain/terrain.tscn")
onready var active_terrain = $Game/terrain
var net_generation_seed = "some jubrish"
var actual_seed = hash(net_generation_seed)
var terrain_chunks = []
# Called when the node enters the scene tree for the first time.
func _ready():
	active_terrain.generate_terrain_v5(actual_seed, 200, 200, 20, 30, Vector2(100,100))
	terrain_chunks.append(active_terrain)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Interface/Control/Label.text = "Player position: " + String($Game/RigidBody2D.position) #DEV
	pass



func _on_terrain_entered_body():
	print("node count:", get_tree().get_node_count())
	var terrain_instance = terrain.instance()
	print("instance added")
	print("node count:", get_tree().get_node_count())
	terrain_instance.position = Vector2(active_terrain.position.x + active_terrain.length, active_terrain.position.y)
	$Game.add_child(terrain_instance)
	active_terrain.disconnect("entered_body", self, "_on_terrain_entered_body")
	$Interface/Control/Button.disconnect("pressed", active_terrain, "_on_Button_pressed")
	print(terrain_instance.connect("entered_body", self, "_on_terrain_entered_body"))
	$Interface/Control/Button.connect("pressed", terrain_instance, "_on_Button_pressed")
	active_terrain = terrain_instance
	actual_seed = hash(actual_seed+1)
	active_terrain.generate_terrain_v5(actual_seed, 200, 200, 20, 30, Vector2(100,100))
	print("NEW SEED: ", actual_seed)
	terrain_chunks.append(active_terrain)
	while terrain_chunks.size() >= 4:#Deleating not needed anymore chunks of the world
		terrain_chunks[0].queue_free()
		terrain_chunks.remove(0)
	
	
	## Problematic SEED = 1454487252
	
	
	pass # Replace with function body.



