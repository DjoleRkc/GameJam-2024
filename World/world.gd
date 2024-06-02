extends Node2D

var Pirate = preload("res://Enemy/Custom/pirate.tscn")
var Animal = preload("res://Enemy/Custom/animal.tscn")
var Caveman = preload("res://Enemy/Custom/caveman.tscn")

@onready var timer = $Timer

var spawning_positions = [[Vector2(0,0), Vector2(178, 0), Vector2(357, 0), Vector2(536, 0), Vector2(1610, 709), Vector2(1610, 568), Vector2(1610, 427)],
[Vector2(0, 50), Vector2(0, 212), Vector2(0, 425), Vector2(160, 850), Vector2(320, 850), Vector2(480, 850), Vector2(644, 850)],
[Vector2(1076, 0), Vector2(1254, 0), Vector2(1432, 0), Vector2(1610, 0), Vector2(1610, 141), Vector2(1610, 282), Vector2(1610, 423)]]

#[(0,0), (178, 0), (357, 0), (536, 0), (1610, 709), (1610, 568), (1610, 427)] pirate/caveman
#[(0, 50), (0, 212), (0, 425), (160, 850), (320, 850), (480, 850), (644, 850)] pirate
#[(1076, 0), (1254, 0), (1432, 0), (1610, 0), (1610, 141), (1610, 282), (1610, 423)] animal/caveman

var sp = 0

func _process(delta):
	if GameStats.game_state == false:
		get_tree().change_scene_to_file("res://World/night.tscn")
	if GameStats.enemy_number <= 0:
		if timer.time_left <= 0:
			# pokupi loot
			timer.start(0.5)

func _ready():
	print('r')
	for i in range(0 , GameStats.enemy_number):
		spawn_enemy(sp)
		sp += 1
		if sp >= 3:
			sp = 0

func spawn_enemy(sp):
	var enemy
	if sp == 0:
		if randi() % 2 == 0:
			enemy = Pirate.instantiate()
		else:
			enemy = Caveman.instantiate()
	elif sp == 1:
		enemy = Pirate.instantiate()
	else:
		if randi() % 2 == 0:
			enemy = Animal.instantiate()
		else:
			enemy = Caveman.instantiate()
	
	var main = get_tree().current_scene
	
	main.add_child(enemy)
	enemy.global_position = spawning_positions[sp][randi() % spawning_positions[sp].size()]


func _on_timer_timeout():
	GameStats.next_wave()
	for i in range(0 , GameStats.enemy_number):
		spawn_enemy(sp)
		sp += 1
		if sp >= 3:
			sp = 0
