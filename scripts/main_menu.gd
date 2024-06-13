extends Control

func _on_start_button_pressed():
	SceneSwitcher.change_scene("res://level/main.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

func _on_test_gameover_pressed():
	SceneSwitcher.change_scene("res://level/death.tscn")
