extends Node2D

var lives = 5
var coins = 0
var coins_to_lives = 3

func _ready():
	add_to_group("Gamestate")
	update_GUI()

func hurt():
	lives -= 1
	$Player.hurt()
	update_GUI()
	if lives < 0:
		end_game()
		
func get_lives():
	return lives
		
func update_GUI():
	get_tree().call_group("GUI", "update_GUI", lives, coins)

func coin_up():
	coins += 1
	update_GUI()
	var coins_for_new_life = (coins % coins_to_lives) == 0
	if coins_for_new_life:
		life_up()

func life_up():
	lives += 1
	update_GUI()

func end_game():
	get_tree().change_scene("res://Levels/EndGame.tscn")

func win_game():
	get_tree().change_scene("res://Levels/Victory.tscn")
