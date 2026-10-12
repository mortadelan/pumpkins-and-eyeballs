extends CharacterBody2D

var action : String
var angle : int


func _ready():
	if rotation_degrees >= 180:
		action = "ui_right"
		angle = -45
	else:
		action = "ui_left"
		angle = 45

func _input(event):
	if event.is_action_pressed(action):
		set_rotation_degrees(rotation_degrees + angle)
	if event.is_action_released(action):
		set_rotation_degrees(rotation_degrees - angle)
