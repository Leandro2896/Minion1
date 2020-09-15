extends Node

var score = 0 
const Basic_Ruby = 5
const Basic_Agujero= 3 
export (PackedScene) var Ruby
var screensize = Vector2.ZERO 
onready var player = $Player
onready var agujero = get_node("agujero ")
onready var agujero2 = get_node("agujero2" )
onready var agujero3 = get_node("agujero3")



func _ready():
	randomize() # para hacer que la gemas aparezcan de forma aleatoria
	screensize = get_viewport() . get_visible_rect().size #devuelve el tamaño de la pantalla 
	spawn_rubys()
	call_deferred("definir_valores")
	
#para que los agujeros negros conoxcan al player 	
func definir_valores():
	agujero.player = player
	agujero2.player = player
	agujero3.player = player
	
#para cuando termina el juego	
func game_over ():
	get_tree().change_scene("res://Game oover.tscn")

#para sumar una gema al contador 
func _on_Player_recogida():
	score += 1
	$puntuacion.update_score(score)

#para cuando muere el personaje 
func _on_Player_morir():
	game_over()


# para hacer que la gemas aparezcan de forma aleatoria AL INICIAR EL JUEGO  	
func spawn_rubys():
	for index in range(Basic_Ruby):
		var rub = Ruby.instance()
		rub.position = Vector2 (rand_range(0,screensize.x), rand_range(0,screensize.y))
		$ContenedorDeRubys.add_child(rub)


#este es para que cada sierto tiempo aparezca un nuevo ruby en un lugar aleatorio 
func _on_Timer_timeout():
	var rub = Ruby.instance()
	rub.position = Vector2 (rand_range(0,screensize.x), rand_range(0,screensize.y))
	$ContenedorDeRubys.add_child(rub)
