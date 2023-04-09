extends EnemyState

# #####################
# # WALK LEFT.SCRIPT  #
# #####################

func enter(_msg := {}) -> void:
	get_node("../../AnimationPlayer").stop()
	enemy.scale.x = enemy.scale.y * 1
	get_node("../../AnimationPlayer").play("walk")
	print("enemy: WALK LEFT")
	pass

@warning_ignore("unused_parameter")	
func physics_update(delta: float) -> void:
	enemy.velocity.x = -enemy.speed
	enemy.velocity.y += enemy.gravity * delta
	enemy.move_and_slide()
	
	if enemy.position.distance_to(gv.Hero_position) > 500:
		enemy.previous_state = gv.enemy_fsm.estate.name
		get_node("../../AnimationPlayer").stop()
		estate_machine.transition_to("idle")
		
