extends MarginContainer


func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/game_manager.tscn");


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/mainMenu.tscn");


func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/mainMenu.tscn");


func _on_button_pressed() -> void:
	$"..".toggle_visibility($".");
	$"..".toggle_visibility($"../anaMenu");


func _on_help_menu_exit_button_pressed() -> void:
	pass # Replace with function body.
