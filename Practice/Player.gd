extends KinematicBody2D

var speed = 150

const GRAVITY = 300

var vel = Vector2()

onready var anim_player = $AnimationPlayer

func _physics_process(delta):
	handle_input(delta)
	vel = move_and_slide(vel, Vector2(0, -1))
	
func handle_input(delta):
	vel = Vector2()
	vel.y += delta * GRAVITY
	
	if Input.is_action_pressed("left"):
		vel.x -= 1
		anim_player.play("Walk left")
	if Input.is_action_pressed("right"):
		vel.x += 1
		anim_player.play("Walk")
	vel = vel.normalized() * speed
	
