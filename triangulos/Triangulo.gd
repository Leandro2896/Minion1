extends Area2D
class_name Triangulo


var player 
const ACELERACION= 50
var velocidad = Vector2.ZERO

#para que se mueva el triangulo
func fly(dir:Vector2):
	dir = (player.global_position-position).normalized()
	var aceleracionFinal = dir * ACELERACION
	velocidad += aceleracionFinal
	
		
func _process(delta):
	position += velocidad * delta
	
	
#hace que los triangulos desaparezcan despues de un tiempo
func _on_Timer_timeout(): 
	get_parent().remove_child(self)
	queue_free()
	
	
