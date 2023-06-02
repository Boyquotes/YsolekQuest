# ######################
# # explosive2 .SCRIPT #
# ######################

extends Node2D


@onready var Coin:Area2D

func _ready():
	Coin = get_node("Coin")
	Coin.visible = false
	
@warning_ignore("unused_parameter")	
func _process(delta):
	pass

func _on_box_2_explode():
	Coin.visible = true
	


 
