extends Node2D

var R = 0;
var G = 0;
var B = 0;
var A = 1.0;
var Renk : Color = Color(R,G,B,A);

var enemy_scene = preload("res://Assets/Enemy.tscn");
var koseler = [];

func _ready() -> void:
	$Abi/MaskeW.modulate = Color(R,G,B,A);
	$UI.corners_saved.connect(_on_ui_corners_saved);

func _on_ui_corners_saved(corners):
	koseler = corners;
	
func _process(_delta: float) -> void:
	$Abi/MaskeW.modulate = Color(R,G,B,A);
	if Input.is_action_just_pressed("1"):
		R = 1.0;
	elif Input.is_action_just_released("1"):
		R = 0;
	if Input.is_action_just_pressed("2"):
		G = 1.0;
	elif Input.is_action_just_released("2"):
		G = 0;
	if Input.is_action_just_pressed("3"):
		B = 1.0;
	elif Input.is_action_just_released("3"):
		B = 0;
		
