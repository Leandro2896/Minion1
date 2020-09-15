extends Area2D


signal recogida 

signal morir

const ACELERACION= 10

var velocidad = Vector2.ZERO



func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_look_at_mouse()
	_move_to_mouse(delta)
	
	
#para que ell personaje mira al mouse	
func _look_at_mouse():
	look_at(get_global_mouse_position())

#para que el personaje se mueva 
func _move_to_mouse(delta):
	var direccion = (get_global_mouse_position()-position).normalized()
	var aceleracionFinal = direccion * ACELERACION
	velocidad += aceleracionFinal
	velocidad = velocidad.clamped(325.0)
	position += velocidad * delta 
	if Input.is_action_just_pressed("dash"):
		velocidad= velocidad*3
		position += velocidad * delta 
	
		

#para cuando el personaje entra en contacto con un ruby	
func _on_Player_area_entered(area):
	if area.is_in_group("Ruby"):
		if area.has_method("recoger"):
			area.recoger()
			emit_signal("recogida")
	if area.is_in_group("Enemigo"):
		emit_signal("morir")
	


