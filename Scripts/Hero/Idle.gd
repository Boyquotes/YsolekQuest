extends PlayerState

signal turn(value)


func enter(_msg := {}) -> void:
	player.velocity = Vector2.ZERO
	get_node("../../snd_walk").stop()
	get_node("../../snd_fall").stop()
	get_node("../../AnimationPlayer").stop()
	get_node("../../AnimationPlayer").play("idle")
	gv.Hero_is_on_floor = true
	

func physics_update(_delta: float) -> void:
	if not player.is_on_floor():
		state_machine.transition_to("Air")
		gv.Hero_is_on_floor = false
		return
		
	if gv.Hero_is_paused == true:	
		return

	if Input.is_action_just_pressed("ui_up"):
		state_machine.transition_to("Air", {do_jump = true})
	
	elif Input.is_action_pressed("ui_left"):
		if gv.Hero_is_paused == false:
			player.scale.x = player.scale.y * -1
			gv.Hero_direction = Vector2.LEFT
			state_machine.transition_to("Walk")
			turn.emit(false)  
	
	elif Input.is_action_pressed("ui_right"):
		if gv.Hero_is_paused == false:
			gv.Hero_direction = Vector2.RIGHT
			player.scale.x = player.scale.y * 1
			state_machine.transition_to("Walk")
			turn.emit(true)
		
		
	# RUN RIGHT:	
	if Input.is_action_pressed("run") and Input.is_action_pressed("ui_right"):
		state_machine.transition_to("run_right")
		player.scale.x = player.scale.y * 1
		gv.Hero_direction = Vector2.RIGHT
		
		
	# RUN LEFT:	
	if Input.is_action_pressed("run") and Input.is_action_pressed("ui_left"): 
		state_machine.transition_to("run_left")
		player.scale.x = player.scale.y * -1
		gv.Hero_direction = Vector2.LEFT
				
		
	# TO AIM:	
	if Input.is_action_pressed("Target"):
		state_machine.transition_to("target_up")
		#player.scale.x = player.scale.y * 1
		#gv.hero_sprite.set_flip_h(false) 
		
	# SIT DOWN:	
	if Input.is_action_pressed("ui_down"):
		state_machine.transition_to("target_down")
		#player.scale.x = player.scale.y * 1
		#gv.hero_sprite.set_flip_h(false) 		
		
		
		
		
		
		
		
		
		
		
		
