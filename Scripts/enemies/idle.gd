extends EnemyState

# #################
# # IDLE  .SCRIPT #
# #################

@onready var ray_cast:RayCast2D = get_node("../../PlayerCast2D")

signal first_hero_catch

func enter(_msg := {}) -> void:
	enemy.velocity = Vector2.ZERO
	get_node("../../snd_walk").stop()
	get_node("../../snd_fall").stop()
	get_node("../../AnimationPlayer").stop()
	get_node("../../AnimationPlayer").play("idle")
	print("enemy: IDLE")
		
 
@warning_ignore("unused_parameter")	
func physics_update(delta: float) -> void:
	if not enemy.is_on_floor():
		enemy.previous_state = gv.enemy_fsm.estate.name
		estate_machine.transition_to("Air")
		return
				
					
	if ray_cast.is_colliding():
		if ray_cast.get_collider().name == "Player":
			enemy.player_collision_point = ray_cast.get_collision_point()
			
			if enemy.first_hero_catch == false:
				emit_signal("first_hero_catch")
				enemy.first_hero_catch = true
				print("enemy: First time see profesor")
				get_node("../../snd_first_see").play()
			
			if enemy.global_position.distance_to(enemy.player_collision_point) < enemy.contact_distance:
				if get_node("../../Say").visible == false:
					enemy.previous_state = gv.enemy_fsm.estate.name
					estate_machine.transition_to("Walk_Right")
							
			# print(str(int(enemy.global_position.distance_to
			# (enemy.player_collision_point))))
						
		else:
			print("enemy: ray hit --> " + ray_cast.get_collider().name)	
		
	
	
func _on_enemy_somebody_hitme() -> void:
	if gv.enemy_fsm.estate.name != "Hit":
		enemy.previous_state = gv.enemy_fsm.estate.name
	estate_machine.transition_to("Hit")
		
# func _on_say_it_was_shown() -> void:
# 	print("_on_say_it_was_shown()")
	
	
	
	
	
	
	
	
	
	
#	if gv.Enemy_position.distance_to(gv.Hero_local_position) < enemy.contact_distance:
#		enemy.previous_state = gv.enemy_fsm.estate.name
#		estate_machine.transition_to("Walk_Right")
		
#	if enemy.position.distance_to(gv.Hero_position) > 1300:
#		enemy.previous_state = gv.enemy_fsm.estate.name
#		estate_machine.transition_to("Follow_left")
			
#if get_node("../../snd_first_see").playing != true:
					
	
# print("enemy: ray hit Player")
			# print("enemy: distance to player --> " + 
			# str(int(enemy.position.distance_to
			# (enemy.player_collision_point))))	
	
#get_node("../../AnimationPlayer").stop()	

# enemy.look_at(gv.Hero_position)
	# var EnemyToPlayer = Player.translation - translation		
	# gv.Hero_position.


#enemy.previous_state = gv.fsm.state.name

#print(gv.enemy_fsm.estate.name)

#print(str(enemy.position.distance_to(gv.Hero_position)))

#enemy.velocity.y += enemy.gravity * delta
	#enemy.move_and_slide()
	
	#if enemy.somebody_hitme == true:
		
		
#	if enemy.is_on_floor():
#		estate_machine.transition_to("Idle")
#		get_node("../../snd_fall").play()











