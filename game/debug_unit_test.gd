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
#	$TerrainChunk.print_segments(segments)
	$SpinBox.value = $SpinBox.value + 1
	pass # Replace with function body.


func _on_Button3_pressed():
	$TerrainChunk.generation_seed = $SpinBox.value
	$TerrainChunk.rng.seed = $TerrainChunk.generation_seed
	$TerrainChunk.segment_count_y = 30
	# jeśli dostanie takie samo generation seed i takie samo start height powinno generować ten sam teren
	var segments
	segments = $TerrainChunk.reset_segments()
	segments = $TerrainChunk.generate_segments(segments, 200)
	$RichTextLabel.text = print_segments_dbg(segments, Vector2(0,0), $TerrainChunk.segment_count_x, $TerrainChunk.segment_count_y)
	$SpinBox.value = $SpinBox.value + 1
	pass # Replace with function body.
	
	
	

func print_segments_dbg(segments, current_segment = null, segment_count_x = null, segment_count_y = null):
	var output = ""
	var line_to_print = "        X: "
	var x_values = range(segment_count_x)
	
	for i in x_values:
		line_to_print += "%3d" % i
		line_to_print += "   "
#		
	output += line_to_print + "\n"
	for j in range(segment_count_y-1, -1, -1):
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
			if not current_segment == null and current_segment.x == i and current_segment.y == j:
				line_to_print += ">"
				line_to_print += "%5s" % what_is_in_that_segment
			else:
				line_to_print += "%6s" % what_is_in_that_segment
#		
		output += line_to_print + "\n"
		$RichTextLabel.text = output
	return output
