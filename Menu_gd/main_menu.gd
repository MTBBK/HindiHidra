extends Control

var whichMenu 
func toggle_visibility(object):
	whichMenu = object
	object.visible = !object.visible
	

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		toggle_visibility(whichMenu)
		toggle_visibility($anaMenu)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$playMenu.visible = false
	$settingsMenu.visible = false
	$creditsMenu.visible = false
	$helpMenu.visible = false
