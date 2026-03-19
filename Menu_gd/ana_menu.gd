extends MarginContainer

func _gui_input(event):
	if event.is_action_pressed("ui_cancel"):
		print("Cancel pressed")
		hide()


func _on_play_button_pressed() -> void:
	print("Play ")
	$"..".toggle_visibility($".")
	$"..".toggle_visibility($"../playMenu")


func _on_continue_button_pressed() -> void:
	print("Continue ")
	$"..".toggle_visibility($".")
	$"..".toggle_visibility($"../playMenu")


func _on_settings_button_pressed() -> void:
	print("Settings ")
	$"..".toggle_visibility($".")
	$"..".toggle_visibility($"../settingsMenu")


func _on_credits_button_pressed() -> void:
	print("Credits ")
	$"..".toggle_visibility($".")
	$"..".toggle_visibility($"../creditsMenu")



func _on_quit_button_pressed() -> void:
	print("Quit ")
	get_tree().quit()


func _on_help_button_pressed() -> void:
	print("Credits ")
	$"..".toggle_visibility($".")
	$"..".toggle_visibility($"../helpMenu")
