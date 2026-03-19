extends CharacterBody2D

@export var speed = 200;
signal enemy_death(death_position);
var Health = 100;
var is_death = false;

func _physics_process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed * delta);
	
	if get_parent().get_progress_ratio() > 0.98:
		Data.health -= 1;
		death();
		
	if Health <= 0:
		is_death = true;
		enemy_death.emit(global_position);
		Data.gold += 1;
		death();
	
func death():
	get_parent().get_parent().queue_free();
