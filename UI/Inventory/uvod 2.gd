extends Sprite2D

@onready var timer = $Timer

func _ready():
	timer.start(5)


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://World/world.tscn")
