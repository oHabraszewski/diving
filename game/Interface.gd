extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(int) var oxygen_level = 100 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control2/Panel/ProgressBar.value = oxygen_level
	pass


func _on_OxygenTimer_timeout():
	
	if $"../Game/Air".player_is_in_water:
		oxygen_level -= 1
	else:
		oxygen_level += 10
	if oxygen_level > 100:
		oxygen_level = 100
	pass # Replace with function body.
