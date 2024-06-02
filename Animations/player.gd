extends Node2D

@onready var attackSound = $Sprite2D/player/swordAttack
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	
func _on_animation_started(anim_name):
	if anim_name == "attack":
		attackSound.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
