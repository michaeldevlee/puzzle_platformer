extends Trigger

var area_to_reveal : Area2D

func _ready():
	connect("area_entered", getArea)

func trigger():
	area_to_reveal.set_modulate(Color(1,1,1,0.05))

func getArea(area):
	area_to_reveal = area
