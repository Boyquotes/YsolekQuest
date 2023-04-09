# ######################
# # explosive2 .SCRIPT #
# ######################

extends Node2D

signal get_coin_route(amount)

func _ready():
	$Coin.visible = false

@warning_ignore("unused_parameter")	
func _process(delta):
	pass

func _on_box_2_explode():
	$Coin.visible = true
	

func _on_coin_get_coin(amount):
	emit_signal("get_coin_route",amount)
 
