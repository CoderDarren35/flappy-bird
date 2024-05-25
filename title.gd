extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var highscore = load_file() 
	$Label.text += highscore

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
	
func load_file() -> String:
	var file := FileAccess.open("res://highscore.txt", FileAccess.READ)
	var content := file.get_as_text()
	return content
