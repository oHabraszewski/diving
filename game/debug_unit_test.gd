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
	$TerrainChunk.print_segments(segments)
	$SpinBox.value = $SpinBox.value + 1
	pass # Replace with function body.
