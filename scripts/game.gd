extends Node2D

var score = 0

#func spawn_and_destroy_tree():
	#var new_tree = preload("res://scenes/pine_tree.tscn").instantiate()
	#%PathFollow2D.progress_ratio = randf()
	#new_tree.global_position = %PathFollow2D.global_position
	#add_child(new_tree, true)

func spawn_mob():
	var new_mob = preload("res://scenes/mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob, true)

func _on_timer_timeout():
	spawn_mob()

func _on_player_health_depleted():
	GameoverInterface.visible = true
	GameoverInterface.gameover_interface_on()
	GameoverInterface.display_score()


