extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("fadeIn")
	await get_tree().create_timer(3.3).timeout
	$AnimationPlayer.play("FadeOut")
	await get_tree().create_timer(2.9).timeout
	get_tree().change_scene_to_file("res://Scenes/mainMenu.tscn")
