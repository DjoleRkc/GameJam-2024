extends Area2D

const HitEffect = preload("res://Effects/hit_effect.tscn")

@onready var timer = $Timer
var invincible = false: set = set_invincible

signal invincibility_started
signal invincibility_ended

func set_invincible(value):
	invincible = value
	if invincible == true:
		emit_signal("invincibility_started")
	else:
		emit_signal("invincibility_ended")

func start_invincibility(duration):
	self.invincible = true
	timer.start(duration)


func create_hit_effect():
	var hitEffect = HitEffect.instantiate()
	var main = get_tree().current_scene
	main.add_child(hitEffect)
	hitEffect.global_position = global_position

func _on_timer_timeout():
	self.invincible = false


func _on_invincibility_started():
	set_deferred("monitoring", false)


func _on_invincibility_ended():
	monitoring = true