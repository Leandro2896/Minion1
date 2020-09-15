extends Area2D

onready var triangulo_template = preload("res://triangulos/Triangulo.tscn")
var direction =Vector2(0, -1)
var player 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Timer_timeout():
	fire()

#para disparar triangulos 
func fire():
	var tri:Triangulo= triangulo_template.instance()
	tri.player = player #para que ele triangulo conozca al player 
	tri.global_position = $Position2D.global_position
	tri.fly(direction.rotated(rotation))
	get_parent().add_child(tri)





