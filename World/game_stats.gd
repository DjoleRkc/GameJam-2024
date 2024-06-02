extends Node

var spawn_waves = []
var wave = 0
var enemy_number: set = set_enemy_number
var day = 1: set = set_day
var game_state = true

func _ready():
	generate_waves()
	enemy_number = spawn_waves[wave]
	print(spawn_waves)

func set_enemy_number(value):
	enemy_number = value

func set_day(value):
	day = value

func next_wave():
	wave += 1
	if wave < spawn_waves.size():
		set_enemy_number(spawn_waves[wave])
	else:
		day =+ 1
		game_state = false

func generate_waves():
	spawn_waves.clear()
	for i in range(0, day):
		spawn_waves.append(day * 2)
	
	enemy_number = spawn_waves[wave]
