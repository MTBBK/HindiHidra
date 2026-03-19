extends MarginContainer


func _on_settings_menu_exit_button_pressed() -> void:
	$"..".toggle_visibility($".")
	$"..".toggle_visibility($"../anaMenu")


#1280x720 yaptı projeyi, Stretch Mode'u viewport yaptı
func _on_resolution_button_item_selected(index: int) -> void:
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600,900))
		2:
			DisplayServer.window_set_size(Vector2i(1152,648))


func _on_windowed_chbox_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value/5)


func _on_mute_chbox_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0,toggled_on)
