extends EnemyState

# ####################
# # HIT       SCRIPT #
# ####################

func enter(_msg := {}) -> void:
	get_node("../../AnimationPlayer").stop()
	get_node("../../AnimationPlayer").play("hitme")
	print("enemy: THEY HIT ME")
	

@warning_ignore("unused_parameter")	
func physics_update(delta: float) -> void:
	#enemy.somebody_hitme = false
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "hitme":
		#enemy.previous_state = gv.fsm.state.name
		estate_machine.transition_to(enemy.previous_state)
		#print(enemy.previous_state)


func _on_enemy_somebody_hitme() -> void:
	
	pass 
