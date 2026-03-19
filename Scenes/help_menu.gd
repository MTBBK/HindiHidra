extends MarginContainer



func _on_help_menu_exit_button_pressed() -> void:
	$"..".toggle_visibility($".");
	$"..".toggle_visibility($"../anaMenu");
