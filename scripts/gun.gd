extends Area2D

@onready var precision = 0.2

func _physics_process(delta):
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0 :
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)

func shoot():
	#Instanciation de la balle
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()	
	
	#Placement de la balle dans le gun et alignement avec shooting point
	%ShootingPoint.add_child(new_bullet)
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation + randf_range(-precision, precision)


func _on_timer_timeout():
	if GameoverInterface.score < 10:
		shoot()
	elif GameoverInterface.score > 10 && GameoverInterface.score < 50:
		shoot()
		shoot()
	else:
		shoot()
		shoot()
		shoot()
