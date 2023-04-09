
# ###################################
# # Camera2D  .SCRIPT ZoomingCamera2D
# ###################################



class_name ZoomingCamera2D extends Camera2D

# Lower cap for the `_zoom_level`.
@export var min_zoom := 0.5
# Upper cap for the `_zoom_level`.
@export var max_zoom := 2.0
# Controls how much we increase or decrease the `_zoom_level` on every turn of the scroll wheel.
@export var zoom_factor := 0.1
# Duration of the zoom's tween animation.
@export var zoom_duration := 0.6

var _zoom_level : float = 0.5


func _ready():
	self.drag_right_margin = -0.3
	self.drag_left_margin = 0.8
	_set_zoom_level(_zoom_level)	


func _process(_delta):
	pass
		
		
func _physics_process(_delta):
	position.x = gv.Hero_pos_x
	position.y = gv.Hero_pos_y * 0.1 - 50
	pass

func _set_zoom_level(value: float) -> void:
	_zoom_level = clamp(value, min_zoom, max_zoom)
	var tween:Tween = create_tween()
	tween.set_ease(tween.EASE_OUT)
	tween.set_trans(tween.TRANS_SINE)
	tween.tween_property(self, "zoom", Vector2(_zoom_level,_zoom_level), zoom_duration)
	
#	
func _unhandled_input(event):
	if event.is_action_pressed("zoom_in"):
		_set_zoom_level(_zoom_level - zoom_factor)
	if event.is_action_pressed("zoom_out"):
		_set_zoom_level(_zoom_level + zoom_factor)
