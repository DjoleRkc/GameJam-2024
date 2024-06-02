extends CharacterBody2D

@onready var player_stats = $Stats
@onready var hurtbox = $HurtBox


func _on_hurt_box_area_entered(area):
	player_stats.health -= area.damage * Inventory.armor_strength
	hurtbox.start_invincibility(1)
	hurtbox.create_hit_effect()
	print(player_stats.health)

func _on_stats_no_health():
	get_tree().paused = true
	queue_free()
