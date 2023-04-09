extends Node

var current_scene = null

@onready var fsm:StateMachine
var Hero_pos_x:int = 0
var Hero_pos_y:int = 0
var Hero_local_position:Vector2
var Hero_global_position:Vector2
var Hero_state:String = ""
var Hero_direction = Vector2.RIGHT
var Hero_is_on_floor:bool = false
var Hero_is_on_wall:bool = false

@onready var enemy_fsm:EnemyStateMachine
var Enemy_position:Vector2
var Enemy_global_position:Vector2
var Enemy_direction = Vector2.RIGHT

@onready var player25D_fsm:P25StateMachine
var Player25_position:Vector3
var Player25_global_position:Vector3
var Player25_direction = Vector2.RIGHT



#var project_size = Vector2D(
#		ProjectSettings.get_setting("display/window/size/width"),
#		ProjectSettings.get_setting("display/window/size/height")
#	)
#var current_scale = -1

# Scene switch usage
#func _on_Button_pressed():
#	gv.goto_scene("res://Scene2.tscn")

var platform:String

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	platform = OS.get_name()
	#var root2 = get_node("/root")
	#print(root2.get_rect())		
	var platform_name:String = "Platform: "
	match OS.get_name():
		"Windows", "UWP":
			print(platform_name + "Windows")
		"macOS":
			print(platform_name +"macOS")
		"Linux", "FreeBSD", "NetBSD", "OpenBSD", "BSD":
			print(platform_name + "Linux/BSD")
		"Android":
			print(platform_name + "Android")
		"iOS":
			print(platform_name + "iOS")
		"Web":
			print(platform_name + "Web")
			
	
		
	print("Stage1 ready ...")	

func goto_scene(path):
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:

	call_deferred("_deferred_goto_scene", path)


func _deferred_goto_scene(path):
	# It is now safe to remove the current scene
	current_scene.free()

	# Load the new scene.
	var s:Resource = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene


func _one_shot_timer_example():
	print("start")
	await get_tree().create_timer(1.0).timeout
	print("end")
	
