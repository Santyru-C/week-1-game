extends KinematicBody2D

export var h_speed : float = 500
export var v_speed : float = 200
export var gravity : float = 300

var direction : Vector2 = Vector2.ZERO
var velocity : Vector2 = Vector2.ZERO

enum State {IDLE, JUMP, RUN}

func _ready():
	pass

func flip_sprite():
	if direction.x == 1:
		$AnimatedSprite.flip_h = false
	if direction.x == -1:
		$AnimatedSprite.flip_h = true
		

func get_input():
	
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")

func move():
	velocity.x = h_speed * direction.x
	$AnimatedSprite.animation = "run"
	
func stop():
	velocity.x = 0
	$AnimatedSprite.animation = "idle"
	
func _physics_process(delta):
	get_input()
	
	if direction.x != 0:
		move()
		print(direction.x)
		flip_sprite()
	else:
		stop()
	
	velocity = move_and_slide(velocity, Vector2.UP)
