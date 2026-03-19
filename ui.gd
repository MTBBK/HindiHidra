extends CanvasLayer

var x = 0;
@onready var RedTower = preload("res://Assets/Kuleler/red_tower.tscn");
@onready var MASK_AFRICAN = preload("uid://b7x0p1o26xf4u")
@onready var MASK_AMERICANFOOTBALL = preload("uid://dm515nrh01g4t")
@onready var MASK_MEXICAN = preload("uid://b6nuaj3n0x0dk")
@onready var MASK_PHARAOH = preload("uid://d3frwqyrbhxvu")
@onready var MASK_PLAGUE = preload("uid://cmynjitcomeae")
@onready var sol_alt: Panel = $Panel/SolAlt
@onready var sag_ust: Panel = $Panel/SagUst
@onready var sol_ust: Panel = $Panel/SolUst
@onready var sag_alt: Panel = $Panel/SagAlt
@onready var red_towers: Node2D = $"../Towers/RedTowers"
@onready var green_towers: Node2D = $"../Towers/GreenTowers"
@onready var blue_towers: Node2D = $"../Towers/BlueTowers"
@onready var yellow_towers: Node2D = $"../Towers/YellowTowers"
@onready var magenta_towers: Node2D = $"../Towers/MagentaTowers"
@onready var cyan_towers: Node2D = $"../Towers/CyanTowers"
@onready var arayuz: Panel = $Arayuz
@onready var maske: TextureRect = $Maske

const MASK_JAPAENSE = preload("uid://bfqrrajv76j63")

signal corners_saved(selected_corners);
var active_corners=[];

func _ready() -> void:
	$Kaydet.pressed.connect(_on_save_button_pressed);

func toggle_corner(corner_name: String, is_pressed: bool):
	if is_pressed:
		if not active_corners.has(corner_name):
			active_corners.append(corner_name);
	else:
		active_corners.erase(corner_name);
		
func _on_save_button_pressed ():
	corners_saved.emit(active_corners);
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		if x == 5:
			x = 0;
		else:
			x += 1; 
	match x:
		0:
			arayuz.modulate = Color(255.0, 0.0, 0.0);
			red_towers.visible = false;
			red_towers.process_mode = Node.PROCESS_MODE_DISABLED;
			maske.texture = MASK_JAPAENSE;
		1:
			arayuz.modulate = Color(0.0, 255.0, 0.0);
			red_towers.visible = true;
			red_towers.process_mode = Node.PROCESS_MODE_INHERIT;
			green_towers.visible = false;
			green_towers.process_mode = Node.PROCESS_MODE_DISABLED;
			maske.texture = MASK_PLAGUE;
		2:
			arayuz.modulate = Color(0.0, 0.0, 255.0);
			green_towers.visible = true;
			green_towers.process_mode = Node.PROCESS_MODE_INHERIT;
			blue_towers.visible = false;
			blue_towers.process_mode = Node.PROCESS_MODE_DISABLED;
			maske.texture = MASK_AMERICANFOOTBALL;
		3:
			arayuz.modulate = Color(255.0, 255.0, 0.0);
			blue_towers.visible = true;
			blue_towers.process_mode = Node.PROCESS_MODE_INHERIT;
			yellow_towers.visible = false;
			yellow_towers.process_mode = Node.PROCESS_MODE_DISABLED;
			maske.texture = MASK_PHARAOH;
		4:
			arayuz.modulate = Color(255.0, 0.0, 255.0);
			yellow_towers.visible = true;
			yellow_towers.process_mode = Node.PROCESS_MODE_INHERIT;
			magenta_towers.visible = false;
			magenta_towers.process_mode = Node.PROCESS_MODE_DISABLED;
			maske.texture = MASK_AFRICAN;
		5:
			arayuz.modulate = Color(0.0, 255.0, 255.0);
			magenta_towers.visible = true;
			magenta_towers.process_mode = Node.PROCESS_MODE_INHERIT;
			cyan_towers.visible = false;
			cyan_towers.process_mode = Node.PROCESS_MODE_DISABLED;
			maske.texture = MASK_MEXICAN;  


var sagust = false;
var sagalt = false;
var solust = false;
var solalt = false;

func _on_sol_ust_b_pressed() -> void:
	solust = !solust
	sol_ust.visible = solust
	toggle_corner("SolUst", solust)

func _on_sag_ust_b_pressed() -> void:
	sagust = !sagust
	sag_ust.visible = sagust
	toggle_corner("SagUst", sagust)

func _on_sag_alt_b_pressed() -> void:
	sagalt = !sagalt
	sag_alt.visible = sagalt
	toggle_corner("SagAlt", sagalt)

func _on_sol_alt_b_pressed() -> void:
	solalt = !solalt
	sol_alt.visible = solalt
	toggle_corner("SolAlt", solalt)
