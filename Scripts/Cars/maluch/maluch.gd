extends CharacterBody2D


@export var speed:float = 100
# Vertical acceleration in pixel per second squared.
@export var gravity:float = 700.0

var player_distance:float
enum States {MOVE_RIGHT, MOVE_LEFT, STOP}
var current_state : int = States.MOVE_RIGHT

var particles_res:Resource = preload("res://Scenes/Cars/maluch/smoke_particles.tscn")

@onready var sounds = [load("res://Assets/Sounds/pisk_opon1.wav"),
	load("res://Assets/Sounds/pisk_opon2.wav"),
	load("res://Assets/Sounds/pisk_opon3.wav")]
	
	
func _ready() -> void:
	print("maluch start x: " + str(global_position.x))

@warning_ignore("unused_parameter")
func physics_update(delta: float) -> void:
	pass
		

func _physics_process(_delta):
	match current_state:
		States.STOP:
			_process_on_state_stop()
		States.MOVE_RIGHT:
			_process_on_state_move_right(_delta)
		States.MOVE_LEFT:
			_process_on_state_move_left(_delta)

func _process_on_state_stop() -> void:
		pass
	
func hit():
	print("maluch: bullet hit me! ")
		
@warning_ignore("unused_parameter")		
func _process_on_state_move_right(delta: float) -> void:
	if $smoke_particles.emitting == false:
			$smoke_particles.emitting = true
	
	if $Kolo_l/AnimationPlayer.is_playing() == false:
		$Kolo_l/AnimationPlayer.play("rotate")
		
	if $Kolo_p/AnimationPlayer.is_playing() == false:
		$Kolo_p/AnimationPlayer.play("rotate")
	
	if $Driver/AnimationPlayer.is_playing() == false:
		$Driver/AnimationPlayer.play("head_rotate")
		
	if $Boss/AnimationPlayer.is_playing() == false:
		$Boss/AnimationPlayer.play("rotate")	
		
	if get_node("snd_engine").playing != true:
			get_node("snd_engine").play()				
	
	if global_position.x > randi_range(4000,8500):
		current_state = States.MOVE_LEFT
		$Kolo_l/AnimationPlayer.stop(true)
		$Kolo_p/AnimationPlayer.stop(true)
		$Driver/AnimationPlayer.play("RESET")
		$Boss/AnimationPlayer.play("RESET")
		scale.x = scale.y * -1
		$smoke_particles.emitting = false
		if get_node("snd_engine").playing == true:
			get_node("snd_engine").stop()
			
	velocity.x = speed
	#velocity.y += gravity * delta
	player_distance = global_position.distance_to(gv.Hero_global_position)
	move_and_slide()
	
@warning_ignore("unused_parameter")	
func _process_on_state_move_left(delta: float) -> void:
	if $smoke_particles.emitting == false:
			$smoke_particles.emitting = true
	
	if $Kolo_l/AnimationPlayer.is_playing() == false:
		$Kolo_l/AnimationPlayer.play("rotate")
		
	if $Kolo_p/AnimationPlayer.is_playing() == false:
		$Kolo_p/AnimationPlayer.play("rotate")
	
	if $Driver/AnimationPlayer.is_playing() == false:
		$Driver/AnimationPlayer.play("head_rotate")
	
	if $Boss/AnimationPlayer.is_playing() == false:
		$Boss/AnimationPlayer.play("rotate")	
		
	if get_node("snd_engine").playing != true:
			get_node("snd_engine").play()
	
	if global_position.x < randi_range(200,600):
		current_state = States.MOVE_RIGHT
		$Kolo_l/AnimationPlayer.stop(true)
		$Kolo_p/AnimationPlayer.stop(true)
		$Driver/AnimationPlayer.play("RESET")
		$Boss/AnimationPlayer.play("RESET")
		scale.x = scale.y * 1
		$smoke_particles.emitting = false
		if get_node("snd_engine").playing == true:
			get_node("snd_engine").stop()
			
	velocity.x = -speed
	#velocity.y += gravity * delta
	player_distance = global_position.distance_to(gv.Hero_global_position)
	move_and_slide()		
		

func _on_timer_timeout() -> void:
	speed = randf_range(10.0,400.0)
	if speed < 50 or speed > 300:
		$snd_player.stream = sounds[randi() % len(sounds)]
		if $snd_player.playing != true:
			$snd_player.play()
	
