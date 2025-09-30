extends Control
@onready var coin_label= $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalScript.score


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	coin_label.text= str(GlobalScript.score)
