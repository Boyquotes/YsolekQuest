extends Label

func _process(_delta):
	#if(visible):
	text = "x: %s" % [gv.Hero_pos_x] + "  y: %s" % [gv.Hero_pos_y]
	
