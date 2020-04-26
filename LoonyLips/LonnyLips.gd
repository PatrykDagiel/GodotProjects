extends Control

func _ready():
	var prompts = ["Yann", "Minions", "Greatest"]
	var story = "Once upon a time there was %s in %s and %s"
	$VBoxContainer/DisplayText.text = (story % prompts)
	
func _on_PlayerText_text_entered(new_text):
	update_DisplayText(new_text)
	
func update_DisplayText(words):
	$VBoxContainer/DisplayText.text = words 
	$VBoxContainer/PlayerText.clear()
