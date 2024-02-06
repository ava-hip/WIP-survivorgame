extends CharacterBody2D

var health = 3
@onready var player = get_node("/root/Game/Player")
@onready var score = 0

func _ready(): 
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 500
	move_and_slide()
	
	

func take_damage():
	health -= 1
	%Slime.play_hurt()
	
	if health == 0 :
		GameoverInterface.score += 1
		print(score)
		queue_free()
		const SMOKE_EXPLOSION = preload("res://assets/smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_EXPLOSION.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position



