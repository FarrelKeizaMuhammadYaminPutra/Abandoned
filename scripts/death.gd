extends Node


func _on_restart_button_pressed():
	SceneSwitcher.change_scene("res://level/main.tscn")

func _on_returnto_menu_button_pressed():
	SceneSwitcher.change_scene("res://level/mainmenu.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
