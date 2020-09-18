extends KinematicBody2D

var amount = 0
var velocity = Vector2(0, 0)
var ready_to_shoot = true
onready var Ball = load("res://Ball/Dot.tscn")

func _ready():
	var t = Timer.new()
	t.set_wait_time(1)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	
	
	
	t.queue_free()

func _physics_process(delta):
	velocity.x = 0
	
	if Input.is_action_pressed("left"):
		velocity.x = -6
	if Input.is_action_pressed("right"):
		velocity.x = 6

	position += velocity
	position.x = clamp(position.x, 50, 600)
	
	if Input.is_action_pressed("red"):
		shoot("red")
	if Input.is_action_pressed("yellow"):
		shoot("yellow")
	if Input.is_action_pressed("blue"):
		shoot("blue")

func shoot(color):
		if ready_to_shoot:
			var b = Ball.instance()
			b.color = color
			b.position = position
			b.position += Vector2(0, -40).rotated(rotation)
			get_parent().add_child(b)
			b.apply_central_impulse(Vector2(0,-500).rotated(rotation))
			ready_to_shoot = false
