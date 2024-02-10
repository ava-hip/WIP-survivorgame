extends CharacterBody2D

signal health_depleted

@onready var lrPosition = %SpriteOR
var health = 1.0

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 1000
	move_and_slide()
	
	if direction.x > 0:
		lrPosition.scale.x = 1
	elif direction.x < 0:
		lrPosition.scale.x = -1
	
	#if direction.y > 0:
		#%SpriteOR/HappyBoo/Colorizer/SquareBody/SquareFace.show()
	#elif direction.y < 0:
		#%SpriteOR/HappyBoo/Colorizer/SquareBody/SquareFace.hide()
	
	
	if velocity.length() > 0.0: 
		%HappyBoo.play_walk_animation()
	else :
		%HappyBoo.play_idle_animation()
	
	const DAMAGE_RATE = 1000
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() >0 : 
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		if health <= 0.0:
			health_depleted.emit()
