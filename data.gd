extends Node

var gold = 60;
var health = 100;

enum Tower {RED, GREEN, BLUE, MAGENTA, YELLOW, CYAN}
enum Bullet {RED, GREEN, BLUE, MAGENTA, YELLOW, CYAN}
enum Enemy {RED, GREEN, BLUE, MAGENTA, YELLOW, CYAN}

const TOWER_DATA = {
}

const ENEMY_DATA = {
	Enemy.RED: {'health': 10, 'speed': 1, 'texture': 1},
	Enemy.GREEN: {'health': 10, 'speed': 1, 'texture': 1},
	Enemy.BLUE: {'health': 10, 'speed': 1, 'texture': 1},
	Enemy.YELLOW: {'health': 10, 'speed': 1, 'texture': 1},
	Enemy.MAGENTA: {'health': 10, 'speed': 1, 'texture': 1},
	Enemy.CYAN: {'health': 10, 'speed': 1, 'texture': 1}}
