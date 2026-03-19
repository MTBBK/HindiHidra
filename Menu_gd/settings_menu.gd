extends MarginContainer

@export
var music_bus_name: String
@export
var sfx_bus_name: String

var music_index: int
var sfx_index: int

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

func _ready() -> void:
	music_index = AudioServer.get_bus_index(music_bus_name)	
	sfx_index = AudioServer.get_bus_index(sfx_bus_name)	


func _on_music_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_index,linear_to_db(value))

func _on_sfx_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfx_index,linear_to_db(value))
	
func _on_music_mute_chbox_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(music_index,toggled_on)

func _on_sfx_mute_chbox_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(sfx_index,toggled_on)



	
