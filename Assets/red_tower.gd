extends Tower
 
func _process(_delta: float) -> void:
	if enemies.size() > 0:
		$Taret.look_at(enemies[0].global_position)
		$Taret.rotation -= PI/2;


func _on_reload_timer_timeout() -> void:
	if enemies:
		var dir = Vector2.DOWN.rotated($Taret.rotation).normalized()
		shoot.emit(position + dir * 16, $Taret.rotation, Data.Bullet.RED);
