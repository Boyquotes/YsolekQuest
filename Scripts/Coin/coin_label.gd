extends Label

func _process(_delta):
	text = "%s" % [get_node("../../Player").gold_amount] 

