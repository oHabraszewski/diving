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
	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		self.linear_velocity.x = -240
	if Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		self.linear_velocity.x = 240
	if Input.is_action_pressed("move_stop"):
		self.sleeping = true
	pass
