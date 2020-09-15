extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#para actualizar la puntuacion
func update_score(new_val):
	$Score.text= str(new_val)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
