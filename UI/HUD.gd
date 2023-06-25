extends CanvasLayer

@onready var jump_count = get_node("MarginContainer/HBoxContainer/HBoxContainer/Jump Count")
@onready var life_count = get_node("MarginContainer/HBoxContainer/HBoxContainer2/Life Count") 


func updateHUD(life_value, jump_value):
	life_count.set_text(str(life_value))
	jump_count.set_text(str(jump_value))
