extends Node2D
const PIPE:= preload("res://pipe.tscn")
var timer := 0.00
# Called when the node enters the scene tree for the first time.
func _ready():
	var highscore = load_file() 
	$Camera2D/Label2.text += highscore


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Camera2D.position.x = $RigidBody2D.position.x + 500
	$Camera2D/Label.text = "Score: " + str(int($RigidBody2D.position.x))
	timer += delta
	$Camera2D/Label3.text = "Time: " + str(int(timer))
	print(timer)
func _on_timer_timeout():
	_spawnpipe(-200, 50)


func _on_timer_2_timeout():
	_spawnpipe(750, 1000)
	
func _spawnpipe(high, low):
	var pipe: = PIPE.instantiate()
	pipe.position.x =  $RigidBody2D.position.x + 1152
	pipe.position.y = randi_range(high, low)
	add_child(pipe)
	
func save_file(content: String):
	var file = FileAccess.open("res://highscore.txt", FileAccess.WRITE)
	file.store_string(content)
	
func load_file() -> String:
	var file := FileAccess.open("res://highscore.txt", FileAccess.READ)
	var content := file.get_as_text()
	return content
