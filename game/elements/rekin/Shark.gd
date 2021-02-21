extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal detected_player_in_sharks_mouth

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func changeSize(new_size: int = 100, time: float = 10):
	var anim := Animation.new()
	anim.loop = true
	anim.length = time
	var track_index = anim.add_track(Animation.TYPE_VALUE)
	anim.track_set_path(track_index, "AnimatedSprite:position")
	anim.track_insert_key(track_index, 0.0, Vector2(0,0))
	anim.track_insert_key(track_index, time / 2, Vector2(new_size, 0))
	anim.track_insert_key(track_index, time, Vector2(0,0))
	track_index = anim.add_track(Animation.TYPE_VALUE)
	anim.track_set_interpolation_type(track_index, Animation.INTERPOLATION_NEAREST)
	anim.track_set_path(track_index, "AnimatedSprite:scale")
	anim.track_insert_key(track_index, 0.0, Vector2(-1, 1))
	anim.track_insert_key(track_index, time / 2, Vector2(1, 1))
	anim.track_insert_key(track_index, time, Vector2(-1, 1))
	$AnimationPlayer.remove_animation("swimming")
	$AnimationPlayer.add_animation("swimming", anim)
	$AnimationPlayer.play("swimming")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
