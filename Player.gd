extends KinematicBody2D

var rot_amount = 1.5
var ready_to_shoot = true
onready var Ball = load("res://Ball/Ball.tscn")

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		rotation_degrees -= rot_amount
	if Input.is_action_pressed("right"):
		rotation_degrees += rot_amount

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
			b.apply_central_impulse(Vector2(0,-100).rotated(rotation))
			ready_to_shoot = false
			$Reload.start()


func _on_Reload_timeout():
	ready_to_shoot = true
