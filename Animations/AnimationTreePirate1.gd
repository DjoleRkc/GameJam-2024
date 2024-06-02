extends AnimationTree
@onready var player = %player
@onready var attackSound = %swordAttack
@onready var animationTree = %AnimationTreePirate1
@onready var health = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	animationTree.active = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var animState = animationTree.get("parameters/playback")
	
	if health <=0:
		animState.travel("dying_pirate1")
	
	elif Input.is_action_pressed("ui_attack"):
		animState.travel("attack_pirate1")
	elif Input.is_action_pressed("ui_walk"):
		animState.travel("walk_pirate1")
