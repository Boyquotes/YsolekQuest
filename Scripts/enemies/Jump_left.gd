extends EnemyState

# #####################
# # JUMP LEFT.SCRIPT   #
# #####################

var stop:bool = false

func enter(_msg := {}) -> void:
	enemy.velocity.y = - enemy.jump_impulse
	get_node("../../AnimationPlayer").stop()
	get_node("../../AnimationPlayer").play("Jump")
	if get_node("../../snd_jump").playing != true:
		get_node("../../snd_jump").play()
	print("enemy fsm: JUMP LEFT")
	
@warning_ignore("unused_parameter")	
func physics_update(delta: float) -> void:
				
	enemy.velocity.x = - enemy.speed + 100
	enemy.velocity.y += enemy.gravity * delta
	
	if stop == false:
		enemy.move_and_slide()
		
	if enemy.is_on_floor():
		if stop == false:
			if get_node("../../snd_fall").playing != true:
				get_node("../../snd_fall").play()
			get_node("../../AnimationPlayer").stop()
			get_node("../../AnimationPlayer").play("idle")	
			
			# await get_tree().create_timer(0.1).timeout
			enemy.previous_state = gv.enemy_fsm.estate.name
			estate_machine.transition_to("idle")
	
	
