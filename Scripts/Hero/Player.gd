


# |#################|
# |# PLAYER.SCRIPT #|
# |#################|


class_name Hero
extends CharacterBody2D

# Horizontal speed in pixels per second.
@export var speed := 250.0
# Vertical acceleration in pixel per second squared.
@export var gravity := 2000.0
# Vertical speed applied when jumping.
@export var jump_impulse := 1200.0

var screen_size : Vector2
var gun_fire:bool = false
var turn:bool = true
var weapon : Sprite2D
var health:int = 100
const health_max:int = 100


signal player_stats_changed
signal bomb_hit_me


func _ready():
	gv.fsm = $StateMachine
	screen_size = get_viewport_rect().size
	set_process(true)
	set_process_input(true)
	weapon = get_node("Torso/arm_r/Gun2")
	emit_signal("player_stats_changed", self)
	print("Hero: ready ...") 
		

func _physics_process(_delta):
	gv.Hero_global_position = global_position
	gv.Hero_local_position = position
	if position.x < -10:
		position.x = 50
	if gun_fire == true:
		if turn == true:
			position.x -= 3
		else:	
			position.x += 3
		gun_fire = false

	if is_on_wall():
		gv.Hero_is_on_wall = true
	else:
		gv.Hero_is_on_wall = false

	

func _process(_delta: float) -> void:
	#gv.H = gv.fsm.state.name
	pass
	
func _on_gun_2_fire() -> void:
	gun_fire = true
	print("Hero: me shoot")

		
func _on_idle_turn(value):
	turn = value

func hit():
	print("Hero: enemies hit me by bullet!") 
	if health > 0:
		health -= 10
	

func _on_player_area_area_entered(area: Area2D) -> void:
	print("PlayerArea hit by: " + area.name) 

func bomb_explode():
	if health > 0:
		health -= 25	
	print("Hero: enemies hit me by drone big bomb!")
	
	gv.fsm.transition_to("Hit_bomb")


# #################
# # GARBAGE       #
# #################


# # You Use int("234"), str(249), ...

#if turn == true:
		#var pos = position.angle_to_point(get_global_mouse_position())
		#if pos > 0.8 or pos > -1.436: 
		#weapon.global_rotation = rad_to_deg(global_position.angle_to(get_global_mouse_position()))
		
		#weapon.global_rotation = position.angle_to_point(get_global_mouse_position())
		# + 0.035
		
		#weapon.global_rotation = get_global_mouse_position().angle_to_point(position)	
		
		#print_debug(pos)  
	#else:
		#weapon.global_rotation = -3.1 
	

#func _draw():
	#draw_line(marker.global_position, get_global_mouse_position(), Color(255, 255, 0), 1)

#func _draw():
#	draw_line(Vector2(0,0), Vector2(50, 50), Color(255, 0, 0), 1)







#var last_y_mpos = 0
#@onready var fsm := $StateMachine

#if turn == true:
#		weapon.global_rotation = -0.01 + (gv.mouse_pos.y*2) * 0.001
#	else:
#		weapon.global_rotation = -3.1 + (gv.mouse_pos.y*2) * 0.001


	
	#var mpath = gv.mouse_pos.y - last_y_mpos

#var bullet_spawn = get_node("Torso/arm_r/Gun/BulletsSpawn").get_global_position()
#		var distance = gv.mouse_pos - get_node("Torso/arm_r/Gun/BulletsSpawn").get_global_position()
#		var ass = get_node("Torso/arm_r/Gun/BulletsSpawn").get_global_position().distance_to(gv.mouse_pos)
		#var ass2 = distance.length()

		#if ass > 320:
		
		#weapon.global_rotation = distance.angle()

#if Input.is_action_just_pressed("ui_up"):
		
	
#	if turn == true:
#		weapon.global_rotation = -0.01
#	else:
#		weapon.global_rotation = -3.1

	#last_y_mpos = gv.mouse_pos.y	


#if Input.is_action_just_pressed("ui_up"):
		
	
#	if turn == true:
#		weapon.global_rotation = -0.01
#	else:
#		weapon.global_rotation = -3.1

	#last_y_mpos = gv.mouse_pos.y	

#print_debug("gun_fire")  

#if value == false:
		#weapon.set_flip_v(true)

#var normalized = (get_local_mouse_position() - bullet_spawn).normalized()
		#var target = bullet_spawn + normalized * 100
		#drawline(bullet_spawn, target, Color(255, 0, 0, 0.5), 3, true)
		
		#update()
		
		#weapon.global_rotation += 0.01
		#print_debug(mpath)  
		#weapon.global_rotation = -0.01 + (mpath	*0.01)















