extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var terrain = preload("res://elements/terrain.tscn")
onready var active_terrain = $Game/terrain
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
	pass # Replace with function body.



