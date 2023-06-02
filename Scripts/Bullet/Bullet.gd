extends Area2D

@export var speed = 4200
var hit:bool = false
var bulas:String

func _ready():
	$BulletCrash.stop()
	$BulletCrash.visible = false
	hit = false
	print("Player bullet name: " +self.name)
	
func _physics_process(delta):
	if hit == false:
		position += transform.x * speed * delta

@warning_ignore("unused_parameter")
func _on_area_entered(area):
	print("Player bullet hit Area2D: " + area.name)
	if area.has_method("hit"):
		area.hit()	
	hit = true
	#$CollisionShape2D.disabled = true
	$CollisionShape2D.set_deferred("disabled", true) 
	$BulletSprite.visible = false
	$BulletCrash.visible = true 
	$BulletCrash.play("hit_anim")
	$snd_bullet_hit.play()
	

func _on_body_entered(body):
	print("bullet hit Body: " + body.name)
	hit = true
	#$CollisionShape2D.disabled = true
	$CollisionShape2D.set_deferred("disabled", true)  
	$BulletSprite.visible = false
	$BulletCrash.visible = true 
	$BulletCrash.play("hit_anim")
	$snd_bullet_hit.play()
	if body.has_method("hit"):
		body.hit()	
	#queue_free()
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_bullet_crash_animation_finished() -> void:
	queue_free()



#$CollisionShape2D.disabled = true
	
	#if area.has_method("hit"):
		#area.hit()
	
	#if bulas == "Bullet":
		#hit = true
		#queue_free() 
		#$BulletSprite.visible = false
		#$BulletCrash.play("hit_anim")		
	
	#if bulas != "Bullet":
	#print("bullet hit Area2D: " + area.name)
		#hit = true
		#$BulletSprite.visible = false
		#$BulletCrash.play("hit_anim")
	#if area.is_in_group("Explosives"):
		#area.queue_free()
	#queue_free()  




#if body.is_in_group("Explosives"):
		#body.queue_free()

#func _on_bullet_crash_animation_finished():
	#if $BulletCrash.get_animation() == "hit_anim":
		#queue_free()
		#pass


# print("bullet hit Area2D: " + area.name)
	# String substr ( int from, int len=-1 )
	# String validate_node_name ( )
	# bullet hit Area2D: @Bullet@4
	# trim_prefix ( String prefix )
	# var bulas:String = area.name.substr ( 1,6 )
	#bulas = area.name
	#bulas = bulas.substr ( 0,6 )



#extends Area2D
#
#@export var speed = 3000
#
#func _ready():
#	pass 
#
#func _process(delta):
#	position += (Vector2.RIGHT * speed).rotated(rotation)*delta
#
#
#func _physics_process(delta):
#	await get_tree().create_timer(0.01).timeout	
#	set_physics_process(false)
#
#
#func _on_visible_on_screen_notifier_2d_screen_exited():
#	queue_free()
	
#func _on_body_entered(body):
	#queue_free()












