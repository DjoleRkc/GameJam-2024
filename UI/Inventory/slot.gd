extends Panel

@onready var backgroundSprite : Sprite2D = $background
@onready var itemSprite : Sprite2D = $CenterContainer/Panel/item

@onready var count_label = $CenterContainer/Panel/Label

func update(item: String):
	if itemSprite.name == "iron.png":
		count_label.text = str(Inventory.iron_count)
	elif itemSprite.name == "wood.png":
		count_label.text = str(Inventory.wood_count)
	elif itemSprite.name == "food.png":
		count_label.text = str(Inventory.food_count)
	
