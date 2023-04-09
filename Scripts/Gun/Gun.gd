# ##########
# GUN2.SCRIPT
# ##########
extends Sprite2D

var can_fire:bool = true
var bullet:Resource = preload("res://Scenes/Bullet/Bullet.tscn")
var recoil:int = 50
const ammo_max:int = 45
var ammo:int = ammo_max
signal fire

func _ready():
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
	var blt:Node = bullet.instantiate()
	get_tree().root.add_child(blt)
	#$BulletsSpawn.call_defered("add_child",blt)
	blt.transform = get_node("BulletsSpawn").global_transform
	$snd_fire1.play()
	fire.emit()
	
			
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
