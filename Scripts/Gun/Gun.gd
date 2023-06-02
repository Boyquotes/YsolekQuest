# ##########
# GUN2.SCRIPT
# ##########
extends Sprite2D

var can_fire:bool = true
var bullet:Resource = preload("res://Scenes/Bullet/Bullet.tscn")
var bullet_shell:Resource = preload("res://Scenes/Bullet/Bullet_shell.tscn")
var recoil:int = 50
var shoots:int = 0
const ammo_max:int = 45
var ammo:int = ammo_max
signal fire

func _ready():
	#$Bullet_shell.emiting(false)
	pass
		
func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
				
	if Input.is_action_just_pressed("Fire"):
		if gv.fsm.state.name == "Idle":
			position.y = position.y + recoil
		else:
			position.y = position.y + recoil
			position.x = position.x - recoil
		$Timer.start(0.1)
		shoot()

				
func shoot():
	if ammo > 0:
		ammo -= 1
	else:
		return	
	var blt:Area2D = bullet.instantiate()
	var shell:RigidBody2D = bullet_shell.instantiate()
	blt.name = "Bullet" + str(shoots)
	get_tree().root.add_child(blt)
	get_tree().root.add_child(shell)
	#$BulletsSpawn.call_defered("add_child",blt)
	blt.transform = get_node("BulletsSpawn").global_transform
	shell.transform = get_node("Shells_spawn").global_transform
	shoots += 1
	$snd_fire1.play()
	fire.emit()
	#$Bullet_shell.restart()
	#$Bullet_shell.emiting(true)
	
			
func _on_timer_timeout():
	if gv.fsm.state.name == "Idle":
		position.y = position.y - recoil
	else:
		position.y = position.y - recoil	
		position.x = position.x + recoil  
	#pass

#func _draw():
	#draw_line($BulletsSpawn.position, get_global_mouse_position(), Color(255, 255, 0), 1)

#mouse_pos = get_global_mouse_position()
#global_rotation = rad_to_deg(global_position.angle_to(get_global_mouse_position()))/2
#global_rotation = position.angle_to_point(get_global_mouse_position())
#print_debug(get_global_mouse_position())	
