extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal moved(player)
signal bumped_into_rocks()
export var side_force_multiplier = 1.0
export var vertical_force_multiplier = 1.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"../Air".player_moved(self)
	if Input.is_action_pressed("move_up") and self.linear_velocity.y > -300:
		self.linear_velocity.y -= 10 * vertical_force_multiplier
	if $"../Air".player_is_in_water:
		if Input.is_action_pressed("move_down") and self.linear_velocity.y < 350:
			self.linear_velocity.y += 20 * vertical_force_multiplier
			
		if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right") and self.linear_velocity.x > -380:
			self.linear_velocity.x -= 15 * side_force_multiplier
			self.get_child(0).flip_h = true
			
		if Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left") and self.linear_velocity.x < 380:
			self.linear_velocity.x += 15 * side_force_multiplier
			self.get_child(0).flip_h = false
			
		
	else:
		if Input.is_action_pressed("move_down"):
			self.linear_velocity.y += 5 * vertical_force_multiplier
			
		if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right") and self.linear_velocity.x > -180:
			self.linear_velocity.x -= 4 * side_force_multiplier
			self.get_child(0).flip_h = true
			
		if Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left") and self.linear_velocity.x < 180:
			self.linear_velocity.x += 4 * side_force_multiplier
			self.get_child(0).flip_h = false
	
	$CollisionShape2D.rotation = deg2rad(self.linear_velocity.x/380)*25
	$nurek.rotation = deg2rad(self.linear_velocity.x/380)*25
	$Area2D.rotation = deg2rad(self.linear_velocity.x/380)*25
	
	if self.linear_velocity.y < 10:
		self.linear_velocity.y += 1
		
	if self.linear_velocity.y > 10:
		self.linear_velocity.y -= 1
	
	if self.linear_velocity.x < 0:
		self.linear_velocity.x += 5
	##by zmniejszać prędkość imitując opór wody
	if self.linear_velocity.x > 0:
		self.linear_velocity.x -= 5
	##by zmniejszać prędkość imitując opór wody
	## Po co te if'y?????
pass




func _on_Area2D_body_entered(body):
	if body.collision_layer == 2:
		self.linear_velocity = Vector2((-0.7)*self.linear_velocity.x, (-0.7)*self.linear_velocity.y-8)
		$AnimationPlayer.play("taking damage")
		$Particles2D3.emitting = true
		emit_signal("bumped_into_rocks")
	pass # Replace with function body.


func _on_Timer_timeout():
	if $"../Air".player_is_in_water:
		$Particles2D2.emitting = true
	pass # Replace with function body.

