extends StaticBody2D

func _ready():
	choose()
	#$Timer.wait_time = ((randi()%30)/10.0)+1.0


func choose():
	var r = randi()%3
	if r == 0:
		red()
	elif r == 1:
		yellow()
	elif r == 2:
		blue()

func red():
	modulate = Color(1,0,0,1)
	set_collision_layer_bit(0,false)
	set_collision_layer_bit(1,true)
	set_collision_layer_bit(2,true)
	set_collision_mask_bit(0,false)
	set_collision_mask_bit(1,true)
	set_collision_mask_bit(2,true)

func yellow():
	modulate = Color(1,1,0,1)
	set_collision_layer_bit(0,true)
	set_collision_layer_bit(1,false)
	set_collision_layer_bit(2,true)
	set_collision_mask_bit(0,true)
	set_collision_mask_bit(1,false)
	set_collision_mask_bit(2,true)

func blue():
	modulate = Color(0,0,1,1)
	set_collision_layer_bit(0,true)
	set_collision_layer_bit(1,true)
	set_collision_layer_bit(2,false)
	set_collision_mask_bit(0,true)
	set_collision_mask_bit(1,true)
	set_collision_mask_bit(2,false)


func _on_Timer_timeout():
	choose()


func _on_Delete_body_entered(body):
	#body.queue_free()
	queue_free()
	pass
