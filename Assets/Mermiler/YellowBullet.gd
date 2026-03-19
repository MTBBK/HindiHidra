extends CharacterBody2D

var target:Vector2;
var Speed = 1000;
var pathName = "";
var bulletDamage = 5;
@onready var laser: Line2D = $Laser
	
func _physics_process(delta):
	laser.visible = true;
	velocity = global_position.direction_to(target) * Speed;

	look_at(target);
	
	move_and_slide();

func _on_area_2d_body_entered(body: Node2D) -> void:
	if "Enemy" in body.name:
		body.Health -= bulletDamage;
		queue_free();
