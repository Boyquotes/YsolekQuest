extends TextureProgressBar


func _ready():
	#print_debug("health ready ...") 
	value = get_node("../../Player").health

@warning_ignore("unused_parameter")
func _process(delta):
	#print_debug(value)
	value = get_node("../../Player").health 
	pass

