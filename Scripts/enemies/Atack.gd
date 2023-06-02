extends EnemyState


# ####################
# # ATACK     SCRIPT #
# ####################

func enter(_msg := {}) -> void:
	print("enemy fsm: DIRECT ATTACK")
	pass

@warning_ignore("unused_parameter")	
func physics_update(delta: float) -> void:
	pass	
