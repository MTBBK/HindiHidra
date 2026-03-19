extends StaticBody2D

var bulletDamage = 50;
var currTargets = [];
var curr;

var reload = 0;
var level = 1;

@onready var timer = get_node("Upgrade/ProgressBar/Timer");
var startShooting = false;

func _process(delta: float) -> void:
	get_node("Upgrade/ProgressBar").global_position = global_position + Vector2(0,10);
	if is_instance_valid(curr):
		self.look_at(curr.global_position);
		if timer.is_stopped():
			timer.start();
	else:
		update_target();

	update_powers();

func _on_tower_body_entered(body: Node2D) -> void:
	if "Enemy" in body.name:
		if not body.is_connected("enemy_death", _on_enemy_death_in_range):
			body.enemy_death.connect(_on_enemy_death_in_range);
		update_target();
		
func _on_tower_body_exited(body: Node2D) -> void:
	if "Enemy" in body.name:
		if body.is_connected("enemy_death", _on_enemy_death_in_range):
			body.enemy_death.disconnect(_on_enemy_death_in_range);
	update_target();

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_mask == 1:
		var towerPath = get_tree().get_root().get_node("GameManager/Towers/GreenTowers");
		for i in towerPath.get_child_count():
			if towerPath.get_child(i).name != self.name:
				towerPath.get_child(1).get_node("Upgrade/Upgrade").hide();
		get_node("Upgrade/Upgrade").visible = !get_node("Upgrade/Upgrade").visible;
		get_node("Upgrade/Upgrade").global_position = global_position + Vector2(-17,10);


func _on_up_up_pressed() -> void:
	if reload <= 2:
		reload += 0.1;
	timer.wait_time = 3 - reload;
	bulletDamage += 1;
	level += 1;

func update_powers():
	get_node("Upgrade/Upgrade/UpUp/Label").text=str(level);
	
func update_target():
	currTargets = get_node("Tower").get_overlapping_bodies();
	var tempArray = [];
	for e in currTargets:
		if "Enemy" in e.name:
			tempArray.append(e);
			
	var currTarget = null;
	
	for i in tempArray:
		if currTarget == null:
			currTarget = i.get_node("../");
		else:
			if i.get_parent().get_progress() > currTarget.get_progress():
				currTarget = i.get_node("../");  
				
	curr = currTarget;
	
func _on_enemy_death_in_range(_death_pos):
	var in_range = get_node("Tower").get_overlapping_bodies();
	for body in in_range:
		if "Enemy" in body.name and body.Health > 0:
			body.Health -= bulletDamage;
