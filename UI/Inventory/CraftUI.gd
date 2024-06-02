extends Button

@onready var backgroundSprite = $background
@onready var itemSprite = $CenterContainer/Panel/item
@export var craft_1: Button
@export var craft_2: Button

var toggle = false

signal btn_toggled

func _ready():
	craft_1.btn_toggled.connect(on_other_toggled)
	craft_2.btn_toggled.connect(on_other_toggled)

func _on_pressed():
	emit_signal("btn_toggled")
	if !toggle:
		backgroundSprite.frame = 0
		toggle = !toggle
	else: 
		backgroundSprite.frame = 1
		toggle = !toggle
	
	print(toggle)

func on_other_toggled():
	backgroundSprite.frame = 0
	toggle = false

func _on_craft_pressed():
	#print("enter")
	#print(toggle)
	if toggle:
		print("yes")
		print(itemSprite.texture)
		if itemSprite.name == 'wood_sword.png' || itemSprite.name == 'iron_sword.png':
			print("sword")
			Inventory.craft_sword()
		elif itemSprite.name == 'wood_armor.png' || itemSprite.name == 'iron_armor.png':
			print("armor")
			Inventory.craft_armor()
		elif itemSprite.name == 'meal.png':
			print("meal")
			Inventory.craft_meal()
