extends Control

var player_words = []
var story = "Once upon a time there was %s in %s and %s in %s"
var prompts = ["a name", "a noun", "an adverb", "an adjective"]

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText

func _ready():
	welcome_prompt()
	check_player_words_length()


func _on_PlayerText_text_entered(new_text):
	add_to_player_words()

func _on_TextureButton_pressed():
	add_to_player_words()
	
func welcome_prompt():
	DisplayText.text = "Welcome to the game"
	
func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ""
	PlayerText.clear()
	check_player_words_length()

func is_story_done(): 
	return player_words.size() == prompts.size()
	
func prompt_player():
	DisplayText.text += "May I have " + prompts[player_words.size()] + " please?"

func tell_story():
	DisplayText.text = story % player_words

func check_player_words_length():
	if is_story_done():
		tell_story()
	else:
		prompt_player()
