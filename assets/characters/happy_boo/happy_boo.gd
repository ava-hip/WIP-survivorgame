extends Node2D


func play_idle_animation():
	%AnimationPlayer.play("IDLE")


func play_walk_animation():
	%AnimationPlayer.play("walk")
