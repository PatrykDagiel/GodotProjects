extends CanvasModulate

const DARK = Color('4c4c4c')
const NIGHT_VISION = Color('319a0b')

var cooldown = false

func _ready():
	color = DARK
	visible = true

func cycle_vision_mode():
	if not cooldown:
		if (color == NIGHT_VISION):
			turnOnDarkMode()
		else:
			turnOnDarkVisionMode()
		cooldown = true
		$ModeCooldown.start()

func turnOnDarkMode():
	color = DARK
	$NightvisionSound.stream = load("res://SFX/nightvision_off.wav")
	$NightvisionSound.play()
func turnOnDarkVisionMode():
	color = NIGHT_VISION
	$NightvisionSound.stream = load("res://SFX/nightvision.wav")
	$NightvisionSound.play()
	
func _on_ModeCooldown_timeout():
	cooldown = false
