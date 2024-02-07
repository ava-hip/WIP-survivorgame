extends CanvasLayer

@onready var bestScore = 0
@onready var score = 0

func _ready():
	pass

func gameover_interface_on():
	self.visible = true
	get_tree().paused = true


func gameover_interface_off():
	get_tree().paused = false
	self.visible = false
	get_tree().reload_current_scene()

func _on_restart_pressed():
	GameoverInterface.gameover_interface_off()
	GameoverInterface.score = 0

func _on_quit_pressed():
	get_tree().quit()

func display_score():
	score = GameoverInterface.score
	if GameoverInterface.score > GameoverInterface.bestScore :
		bestScore = GameoverInterface.score
	
	%Score.text = str("Score: ", GameoverInterface.score) 
	%BestScore.text = str("Meilleur score: ", GameoverInterface.bestScore)
