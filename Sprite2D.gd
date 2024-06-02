extends Sprite2D

@onready var timer = $Timer

func _ready():
	timer.start(5)


func _on_timer_timeout():
	get_tree().change_scene_to_packed(load("res://UI/Inventory/uvod 2.tscn"))
	
