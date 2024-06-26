extends Node

# Private variable
var _params = null

# Call this instead to be able to provide arguments to the next scene
func change_scene(next_scene, params=null):
	_params = params
	get_tree().change_scene_to_file(next_scene)
	

# In the newly opened scene, you can get the parameters by name
func get_param(param_name):
	if _params != null and _params.has(param_name):
		return _params[param_name]
	return null
