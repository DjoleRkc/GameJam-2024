extends Node2D
@onready var attackSound = %swordAttack
@onready var player = $Sprite2D/player
@onready var meleeAttackSound = %meleeAttack
@onready var knightAttackSound = %knightAttack
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_idle"):
		player.play("idle_caveman")


