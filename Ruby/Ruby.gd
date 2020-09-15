extends Area2D

#para que el ruby desaparezca al ser tomado 
func recoger():
	get_parent().remove_child(self)
	queue_free()
