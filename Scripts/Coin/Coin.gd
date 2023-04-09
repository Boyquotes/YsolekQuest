
# #################
# # COIN  .SCRIPT #
# #################

extends Area2D

signal get_coin(amount)
#var hit:bool = false
var amount:int = 0

func _ready():
	$coin_img.play("idle")
	$coin_img/Rotation.play("rotate")
	amount = randi() % 20
	if amount == 0:
		queue_free()
	$amount.text = "%s" % [amount]
	
@warning_ignore("unused_parameter")	
func _process(delta):
	pass

func _on_area_entered(area):
	if area.name == "Bullet":
		#hit = true
		$snd_coin.play()
		$coin_img.play("vanish")
		emit_signal("get_coin",amount)
		

func _on_body_entered(body):
	if body.name == "Player":
		#hit = true
		$snd_coin.play()
		$coin_img.play("vanish")
		emit_signal("get_coin",amount)
	
func _on_snd_coin_finished():
	queue_free()

# TRASH:
########


#var tween:Tween 
#var col = Color(0.0, 1.0, 0.0)
#$coin_img.modulate.a = 0.9
#$coin_img.material.set_shader_parameter("white_progress", 1.0)
#queue_free()
#tween = create_tween()
#tween = get_tree().create_tween().bind_node($coin_img)
#tween.tween_property($coin_img,"modulate", Color(0.0, 1.0, 0.0), 1)
#tween.tween_property($coin_img, "position", Vector2(500, 0), 3).as_relative()
#tween.tween_property($coin_img, "rotation", PI, 1)
