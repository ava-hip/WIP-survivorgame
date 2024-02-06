extends CanvasLayer

@onready var score = 0

#func _ready():
	#self.visible = false

func gameover_interface_on():
	self.visible = true
	get_tree().paused = true

func gameover_interface_off():
	get_tree().paused = false
	self.visible = false
	get_tree().reload_current_scene()

func _on_restart_pressed():
	GameoverInterface.gameover_interface_off()
