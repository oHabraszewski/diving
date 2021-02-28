extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_down"):
		self.linear_velocity.y += 20
		
	if Input.is_action_pressed("move_up"):
		if self.linear_velocity.y > -150:
			self.linear_velocity.y -= 10
			
	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right") and self.linear_velocity.x > -200:
		self.linear_velocity.x -= 40
		self.get_child(0).flip_h = true
		
	if Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left") and self.linear_velocity.x < 200:
		self.linear_velocity.x += 140
		self.get_child(0).flip_h = false
	
	
	if self.linear_velocity.y < 10:
		self.linear_velocity.y += 1
		
	if self.linear_velocity.y > 10:
		self.linear_velocity.y += -1
		
	if self.linear_velocity.y > 500:
		self.linear_velocity.y += -20
	
	if self.linear_velocity.x < 0:
		self.linear_velocity.x += 5
		
	if self.linear_velocity.x > 0:
		self.linear_velocity.x += -5
	## Po co te if'y?????
pass
