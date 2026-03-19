extends Panel

@onready var tower = preload("res://Assets/Kuleler/green_tower.tscn");
var currTile;
const TileSize : Vector2 = Vector2(32,32);
@onready var game_manager: Node2D = $"../../..";
var sagust = false;
var sagalt = false;
var solust = false;
var solalt = false;

func _process(delta: float) -> void:
	solust = false;
	sagust = false;
	solalt = false;
	sagalt = false;
	
	for b in game_manager.koseler:
		if b == "SolUst": solust = true;
		if b == "SagUst": sagust = true;
		if b == "SolAlt": solalt = true;
		if b == "SagAlt": sagalt = true;
			
func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_mask == 1:
		var tempTower = tower.instantiate();
		add_child(tempTower);
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED;
		tempTower.global_position = event.global_position;
		tempTower.scale = Vector2(2,2);
		tempTower.modulate.a = 0.5;
	
	elif event is InputEventMouseMotion and event.button_mask == 1:
		if get_child_count() > 0:
			get_child(1).global_position = event.global_position;
			var mapPath = get_tree().get_root().get_node("GameManager/Background/TileMapLayer");
			var tile = mapPath.local_to_map(get_global_mouse_position());
			currTile = mapPath.get_cell_atlas_coords(tile);
			var targets = get_child(1).get_node("TowerDetector").get_overlapping_bodies();
			if targets.size() == 1:
				get_child(1).get_node("Area").modulate = Color(0.0, 255.0, 255.0, 0.1);
			else:
				get_child(1).get_node("Area").modulate = Color(255.0, 255.0, 255.0, 0.1);
	elif event is InputEventMouseButton and event.button_mask == 0:
		if get_child_count() > 1:
					var preview = get_child(1);
					var pos = event.global_position;
					var is_blocked = false;
					
					if pos.x < 1050:
						if pos.x < 575 and pos.y < 325 and solust: is_blocked = true;
						elif pos.x >= 575 and pos.y < 325 and sagust: is_blocked = true;
						elif pos.x < 575 and pos.y >= 325 and solalt: is_blocked = true;
						elif pos.x >= 575 and pos.y >= 325 and sagalt: is_blocked = true;
					else:
						is_blocked = true;
						
					if not is_blocked and Data.gold >= 10:
						if (currTile != Vector2i(3,0) && currTile != Vector2i(2,1)):
							var path = get_tree().get_root().get_node("GameManager/Towers/GreenTowers");
							var newTower = tower.instantiate();
							path.add_child(newTower);
							newTower.global_position = get_global_mouse_position().snapped(TileSize) + Vector2(16, 16);
							newTower.get_node("Area").hide();
							Data.gold -= 10;
					
					preview.queue_free();
	else:
		if get_child_count() > 1:
			get_child(1).queue_free()
