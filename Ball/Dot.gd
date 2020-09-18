extends RigidBody2D

var color = "red"

func _ready():
	if color == "red":
		red()
	elif color == "yellow":
		yellow()
	elif color == "blue":
		blue()
		
	waitToChange()
		
func waitToChange():
	var t = Timer.new()
	t.set_wait_time(3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
			
	changeColor()
	waitToChange()
			
	t.queue_free()
		
func changeColor():
	if color == "red":
		color = "yellow"
		yellow()
		pass
	elif color == "yellow":
		color = "blue"
		blue()
		pass
	elif color == "blue":
		color = "red"
		red()
		pass

func red():
	$Color.color = Color(1,0,0,1)
	set_collision_layer_bit(0,true)
	set_collision_layer_bit(1,false)
	set_collision_layer_bit(2,false)
	set_collision_mask_bit(0,true)
	set_collision_mask_bit(1,false)
	set_collision_mask_bit(2,false)

func yellow():
	$Color.color = Color(1,1,0,1)
	set_collision_layer_bit(0,false)
	set_collision_layer_bit(1,true)
	set_collision_layer_bit(2,false)
	set_collision_mask_bit(0,false)
	set_collision_mask_bit(1,true)
	set_collision_mask_bit(2,false)

func blue():
	$Color.color = Color(0,0,1,1)
	set_collision_layer_bit(0,false)
	set_collision_layer_bit(1,false)
	set_collision_layer_bit(2,true)
	set_collision_mask_bit(0,false)
	set_collision_mask_bit(1,false)
	set_collision_mask_bit(2,true)
