extends TextureProgressBar

var Drone:CharacterBody2D

func _ready():
    Drone = get_parent()
    value = Drone.Drone_health
    position.x = Drone.position.x
    position.y = Drone.position.y - 100
	
@warning_ignore("unused_parameter")
func _physics_process(delta):
    value = Drone.Drone_health
    position.x = Drone.position.x
    position.y = Drone.position.y - 100
