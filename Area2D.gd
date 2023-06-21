extends Area2D

var can_interact : bool = false
var current_interactable : Area2D
var overlapping_interactables = []

func _ready():
	connect("area_entered", is_interactable)
	connect("area_exited", not_interactable)
	
	
func interact():
	if can_interact && current_interactable:
		current_interactable.interact()

func is_interactable(area):
	print(area.name + " entered the area")
	if (area.is_in_group("Interactable") && area.has_method("interact")):
		overlapping_interactables.append(area)
		can_interact = true
		current_interactable = area

func not_interactable(area):
	if area.is_in_group("Interactable"):
		overlapping_interactables.pop_back()
		if overlapping_interactables.size() > 0:
			var last_index = overlapping_interactables.size()-1
			current_interactable = overlapping_interactables[last_index]
		elif overlapping_interactables.size() == 0:
			can_interact = false
			current_interactable = null
			print('no more to interact with')
		
func _process(delta):
	if Input.is_action_just_pressed("ui_right"):
		interact()
