
# ##################
# # Stage 1.SCRIPT #
# ##################

extends Node2D


func _ready():
	randomize()
	#print(get_node("/root"))
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN


#func _process(delta):
	#pass
	
	

		
	
# ShakeScreen.shake(10,1,"Random")	
	
	
# You can import the script using the following syntax:
#const Date = preload("res://assets/util/Date.gd")

# Then you can start creating it with Date.new() etc.
# Note: if you use class_name on top of Date.gd,
# you don't have to explicitely include it, 
# Date will be defined anywhere as if it was 
# imported by default.
# Note 2: if you used the class keyword
# that actually makes an inner class
# (which means you'll need to type Date.Date).
# Scripts are unnamed classes already by default
# (unless named with class_name).
	
