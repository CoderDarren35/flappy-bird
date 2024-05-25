extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		apply_central_impulse(Vector2(0, -500))   
	if abs(linear_velocity.y) > 500:
		linear_velocity.y /= 2                                      			   
	if abs(linear_velocity.x) > 100:
		linear_velocity.x /= 2

func _on_timer_timeout():
	apply_central_impulse(Vector2(100, 0))


func _on_visible_on_screen_notifier_2d_screen_exited():
	var highscore := load_file()
	if int(highscore) < int(position.x):
		save_file(str(int(position.x)))
	get_tree().change_scene_to_file("res://title.tscn")
	
func save_file(content: String):
	var file = FileAccess.open("res://highscore.txt", FileAccess.WRITE)
	file.store_string(content)

func load_file() -> String:
	var file := FileAccess.open("res://highscore.txt", FileAccess.READ)
	var content := file.get_as_text()
	return content


func _on_body_entered(body):
	var highscore := load_file()
	if int(highscore) < int(position.x):
		save_file(str(int(position.x)))
	get_tree().change_scene_to_file("res://title.tscn")

