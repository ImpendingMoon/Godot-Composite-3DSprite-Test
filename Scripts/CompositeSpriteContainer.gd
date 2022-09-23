#AUTHOR : ImpendingMoon
#CREATED: 23 SEP 2022

extends Spatial

#Access all sprites
onready var baseSprite          = $Base
onready var baseBackSprite      = $BaseBack
onready var eyesSprite          = $Face/Eyes
onready var mouthSprite         = $Face/Mouth
onready var hairSprite          = $Hair
onready var hairBackSprite      = $HairBack
onready var topSprite           = $Top
onready var topBackSprite       = $TopBack
onready var bottomSprite        = $Bottom
onready var bottomBackSprite    = $BottomBack
onready var accessorySprite     = $Accessory
onready var accessoryBackSprite = $AccessoryBack

#RandomNumberGenerator has randi_range
var RNG = RandomNumberGenerator.new()

func _ready():
	RNG.randomize()
	
	set_all_random()


#This just spins the sprite for display
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		rotation_degrees.y += (120 *  delta)
	if Input.is_action_pressed("ui_left"):
		rotation_degrees.y -= (120 * delta)


###########################CUSTOM FUNCTIONS#####################################

#Sets a sprite (/its matching back sprite) to an index value.
#Check bounds before calling. 
func set_sprite(index, front_sprite, back_sprite = null):
	front_sprite.frame = index
	if back_sprite != null:
		back_sprite.frame = index


#MANUAL TOGGLING#

func increment_sprite(sprite):
	var upper_bound = sprite.hframes - 1
	
	if sprite.frame >= upper_bound:
		sprite.frame = 0
	else:
		sprite.frame += 1


func decrement_sprite(sprite):
	var upper_bound = sprite.hframes - 1
	
	if sprite.frame <= 0:
		sprite.frame = upper_bound
	else:
		sprite.frame -= 1

#RANDOMIZATION#

#Gets a random valid index number from a sprite
func get_random_index(sprite):
	var index = RNG.randi_range(0, (sprite.hframes - 1) )
	return index

#Needs to be hardcoded for every composite sprite
func set_all_random():
	#                          Index #            Front Sprite     Back Sprite
	set_sprite(get_random_index(baseSprite),      baseSprite,      baseBackSprite)
	set_sprite(get_random_index(eyesSprite),      eyesSprite)
	set_sprite(get_random_index(mouthSprite),     mouthSprite)
	set_sprite(get_random_index(hairSprite),      hairSprite,      hairBackSprite)
	set_sprite(get_random_index(topSprite),       topSprite,       topBackSprite)
	set_sprite(get_random_index(bottomSprite),    bottomSprite,    bottomBackSprite)
	set_sprite(get_random_index(accessorySprite), accessorySprite, accessoryBackSprite)
	
	#Set random scale
	var scale_factor = RNG.randf_range(0.95, 1.05)
	scale = Vector3(scale_factor, scale_factor, scale_factor)

###############################SIGNAL FUNCTIONS#################################

#These would probably be done in a higher node in production (ex. Main)

func _on_RandomizeAll_pressed():
	set_all_random()

#####################################

func _on_PlusBase_pressed():
	increment_sprite(baseSprite)
	increment_sprite(baseBackSprite)

func _on_PlusHair_pressed():
	increment_sprite(hairSprite)
	increment_sprite(hairBackSprite)

func _on_PlusMouth_pressed():
	increment_sprite(mouthSprite)

func _on_PlusEyes_pressed():
	increment_sprite(eyesSprite)

func _on_PlusTop_pressed():
	increment_sprite(topSprite)
	increment_sprite(topBackSprite)

func _on_PlusBottom_pressed():
	increment_sprite(bottomSprite)
	increment_sprite(bottomBackSprite)

func _on_PlusAcc_pressed():
	increment_sprite(accessorySprite)
	increment_sprite(accessoryBackSprite)

######################################

func _on_MinusBase_pressed():
	decrement_sprite(baseSprite)
	decrement_sprite(baseBackSprite)

func _on_MinusHair_pressed():
	decrement_sprite(hairSprite)
	decrement_sprite(hairBackSprite)

func _on_MinusMouth_pressed():
	decrement_sprite(mouthSprite)

func _on_MinusEyes_pressed():
	decrement_sprite(eyesSprite)
	
func _on_MinusTop_pressed():
	decrement_sprite(topSprite)
	decrement_sprite(topBackSprite)
	
func _on_MinusBottom_pressed():
	decrement_sprite(bottomSprite)
	decrement_sprite(bottomBackSprite)

func _on_MinusAcc_pressed():
	decrement_sprite(accessorySprite)
	decrement_sprite(accessoryBackSprite)


