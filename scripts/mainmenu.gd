extends Node3D

@onready var camera_pivot = $camera_pivot

var rotation_speed = 5

func _process(delta):
	camera_pivot.rotation_degrees.y += delta * rotation_speed
