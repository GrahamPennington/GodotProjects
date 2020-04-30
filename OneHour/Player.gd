extends KinematicBody2D

export (int) var speed = 40
export (int) var fly_up = 200
var gravity = 100

var velo = Vector2()

func get_input():
	velo = Vector2()
	
	if Input.is_action_pressed("lower"):
		velo.y += 1
	if Input.is_action_pressed("left"):
		velo.x -= 1
	if Input.is_action_pressed("right"):
		velo.x += 1
		
	velo = velo.normalized() * speed 
	
	if Input.is_action_just_pressed("jump"):
		velo.y -= fly_up
		gravity = 100
	else:
		gravity = 300
	
func _physics_process(delta):
	get_input()
	velo.y += delta * gravity
	velo = move_and_slide(velo, Vector2(0, -1))
	
