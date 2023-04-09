# ##########################
# # Explosive_box  .SCRIPT #
# ##########################

extends Area2D

var hit_count:int

func _ready():
	hit_count = randi_range(1,4)
	$Sprite.stop()
	$Hitpoints.text = str(hit_count)
	pass

func _process(_delta) -> void:
	if hit_count == 0 and $Sprite.is_playing() == false:
	#if hit_count == 0:	
		self.queue_free()

@warning_ignore("unused_parameter")
func _physics_process(delta):
	pass

func _on_area_entered(area):
	if "Bullet".is_subsequence_of(area.name):
		if hit_count > 0:
			print("box1: dostałam od: " + area.name + " hits: " + str(hit_count))
			hit_count -= 1
			$Hitpoints.text = str(hit_count)
			if hit_count == 0:
				$Sprite.play("explode")
				$snd_explode.play()
				ShakeScreen.shake(10,0.5)	
	
@warning_ignore("unused_parameter")
func _on_body_entered(body):
	pass

func hit():
	print("box1: somebody hit me by bullet!") 
	





#print(area.name)
	#  @Bullet@2
	#var str_name:String = area.name
	#str_name = str_name.lstrip()
	#if area.name.find("@Bul") != -1:




#if hit == true: return
	#pass
#	if area.name == "Bullet":
#		if $Sprite.is_playing() == true:
#			print("box1play: dostałam ! od: " + area.name + " hits: " + str(hit_count))
#			hit_count -= 1
#			return
#		hit_count -= 1
#		print("box1: dostałam ! od: " + area.name + " hits: " + str(hit_count))
#		if hit_count == 0:
#			$Sprite.play("explode")
#			$snd_explode.play()
	#self.queue_free()
	
#func _on_body_entered(body):
#	if body.name == "Bullet":
#		print("box1: dostałam od: " + body.name + " hits: " + str(hit_count))
#		$BulletCrash.position = body.position
#		$BulletCrash.play("hit_anim")
#		hit_count -= 1
#		$Sprite.play("explode")
#		$snd_explode.play()
	#pass # Replace with function body.
