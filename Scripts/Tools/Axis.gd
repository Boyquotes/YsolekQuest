extends Node2D
class_name Axis
#@export(int, 1, 20) var width = 10 setget set_width
#
#func set_width(v : int):
#    width = v
#    update()

func _draw() -> void:
	if Engine.is_editor_hint():
		draw_line(Vector2(-100000, 0), Vector2(100000, 0),  Color(255,0,0), 10)
		draw_line(Vector2(0, -100000), Vector2(0, 100000),  Color(255,0,0), 10)


