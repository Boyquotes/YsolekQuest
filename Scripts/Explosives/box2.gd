# #################
# # BOX2  .SCRIPT #
# #################

extends Area2D

var hit_count:int
signal explode

func _ready():
	hit_count = randi_range(1,4)
	$Hitpoints.text = str(hit_count)
	$Sprite.stop()
	pass

func _process(_delta) -> void:
	if hit_count == 0 and $Sprite.is_playing() == false:
	#if hit_count == 0:	
		emit_signal("explode")
		self.queue_free()
		
@warning_ignore("unused_parameter")
func _physics_process(delta):
	pass

func _on_area_entered(area):
	if "Bullet".is_subsequence_of(area.name):
		if hit_count > 0:
			hit_count -= 1
			print("box2: dostałam ! od: " + area.name + " hits: " + str(hit_count))
			$Hitpoints.text = str(hit_count)
			if hit_count == 0:
				$Sprite.play("explode")
				$snd_explode.play()
				ShakeScreen.shake(10,0.5)

@warning_ignore("unused_parameter")	
func _on_body_entered(body: Node2D) -> void:
	pass 


# TRASH:
########

	
#func _on_body_entered(body):
#	print("skrzynka: dostałam !")
#	#pass # Replace with function body.



