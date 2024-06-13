extends CharacterBody3D


const SPEED = 0.3
const accel = 3
const JUMP_VELOCITY = 4.5



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

	
@onready var navAgen = $NavigationAgent3D
@onready var anim_player = $zombie/AnimationPlayer
@export var Player:CharacterBody3D
@onready var raycast = $RayCast3D


func _physics_process(delta):

		
	var direction = Vector3()

	navAgen.target_position = Player.position
	direction = navAgen.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = velocity.lerp(direction*SPEED, accel*delta)
	
	var look_at = Player.position
	look_at.y=position.y
	
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider.has_method("take_damage"):
			Player.take_damage()
	
	look_at(look_at)
	
	move_and_slide()
	
	



func _on_area_3d_body_exited(body):
	if body.has_method("take_damage"):
		anim_player.queue("main/zombie_walk")


func _on_timer_timeout():
	if raycast.is_colliding():
		
		var collider = raycast.get_collider()
		
		if collider.has_method("take_damage"):
			
			anim_player.stop()
			anim_player.play("main/zombie_attack")
			
			
			
