# #####################
# # Mouse     .SCRIPT #
# #####################

extends Sprite2D


func _ready():
	pass


@warning_ignore("unused_parameter")
func _process(delta):
	position = get_global_mouse_position()
	position.x -= 10
	position.y -= 10  
	pass
