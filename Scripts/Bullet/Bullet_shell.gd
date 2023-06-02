extends RigidBody2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	#linear_velocity.x = randf_range(-200,200)
	
	apply_impulse(Vector2(randf_range(-100,100),0))
	#apply_torque_impulse(225)
	#apply_torque(randf_range(-200,200))
	
	#thrust.x = randf_range(-100,100)
	#thrust.y = randf_range(-10,10)
	#set_linear_velocity(Vector2(5,0).rotated(randf() * 2.0 * PI))
	# state.apply_force(thrust.rotated(randf() * 2.0 * PI))

func _integrate_forces(_state):
	pass

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
