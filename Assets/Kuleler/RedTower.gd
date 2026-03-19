extends StaticBody2D

var Bullet = preload("res://Assets/Mermiler/red_bullet.tscn");
var bulletDamage = 5;
var pathNames:String;
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
		for i in get_node("BulletContainer").get_child_count():
			get_node("BulletContainer").get_child(i).queue_free();
	update_powers();
	
func Shoot():
	var tempBullet = Bullet.instantiate();
	tempBullet.pathName = pathNames;
	tempBullet.bulletDamage = bulletDamage;
	get_node("BulletContainer").call_deferred("add_child", tempBullet);
	tempBullet.set_deferred("global_position", $Aim.global_position);


func _on_tower_body_entered(body: Node2D) -> void:
	if "Enemy" in body.name:
		var tempArray = [];
		currTargets = get_node("Tower").get_overlapping_bodies();
		
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
		pathNames = currTarget.get_parent().name;
		
func _on_tower_body_exited(body: Node2D) -> void:
	currTargets = get_node("Tower").get_overlapping_bodies();


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_mask == 1:
		var towerPath = get_tree().get_root().get_node("GameManager/Towers/RedTowers");
		for i in towerPath.get_child_count():
			if towerPath.get_child(i).name != self.name:
				towerPath.get_child(1).get_node("Upgrade/Upgrade").hide();
		get_node("Upgrade/Upgrade").visible = !get_node("Upgrade/Upgrade").visible;
		get_node("Upgrade/Upgrade").global_position = global_position + Vector2(-17,10);


func _on_timer_timeout() -> void:
	Shoot();


func _on_up_up_pressed() -> void:
	if reload <= 2:
		reload += 0.1;
	timer.wait_time = 3 - reload;
	bulletDamage += 1;
	level += 1;

func update_powers():
	get_node("Upgrade/Upgrade/UpUp/Label").text=str(level);
