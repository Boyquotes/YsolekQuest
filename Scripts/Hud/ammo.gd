extends Label

func _process(_delta):
	text = "%s" % [get_node("../../Player/Torso/arm_r/Gun2").ammo] 
