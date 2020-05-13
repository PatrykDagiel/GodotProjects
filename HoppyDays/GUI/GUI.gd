extends CanvasLayer

func _ready():
	add_to_group("GUI")
	
func update_lives(lives_left):
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(lives_left)

