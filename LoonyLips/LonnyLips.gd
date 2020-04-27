extends Control

var player_words = []
var template = [
	{
	"prompts": ["a name", "a noun", "an adverb", "an adjective"],
	"story": "Once upon a time there was %s in %s and %s in %s"
	},
	{
	"prompts": ["x", "y", "z"],
	"story": "Three inputs: %s %s, %s"
	}
]
var current_story

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText

func _ready():
	set_current_story()
	welcome_prompt()
	check_player_words_length()
	PlayerText.grab_focus()

func set_current_story():
	randomize()
	current_story = template[randi() % template.size()]

func _on_PlayerText_text_entered(new_text):
	add_to_player_words()

func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()
	
func welcome_prompt():
	DisplayText.text = "Welcome to the game"
	
func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ""
	PlayerText.clear()
	check_player_words_length()

func is_story_done(): 
	return player_words.size() == current_story.prompts.size()
	
func prompt_player():
	DisplayText.text += "May I have " + current_story.prompts[player_words.size()] + " please?"

func tell_story():
	DisplayText.text = current_story.story % player_words

func check_player_words_length():
	if is_story_done():
		end_game()
	else:
		prompt_player()
		
func end_game():
	PlayerText.queue_free()
	$VBoxContainer/HBoxContainer/Label.text = "Again"
	tell_story()
	
