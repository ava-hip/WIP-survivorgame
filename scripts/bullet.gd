extends Area2D

var travelled_distance = 0

func _physics_process(delta):
	const RANGE = 1200
	var speed = 1200
	
	if GameoverInterface.score < 5:
		speed = 1200
	elif GameoverInterface.score < 15 && GameoverInterface.score > 5:
		speed = 1500
	elif GameoverInterface.score < 30 && GameoverInterface.score > 15:
		speed = 2000
	elif GameoverInterface.score < 50 && GameoverInterface.score > 30:
		speed = 2500
	else: 
		speed = 3500	
	
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * speed * delta
	
	travelled_distance += speed * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	queue_free()
	if body.has_method("take_damage") :
		body.take_damage()
