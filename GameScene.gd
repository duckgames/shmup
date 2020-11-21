extends Node2D

var enemies = {}

func _ready():
	var file = File.new()
	file.open("res://assets/level_1.json", file.READ)
	var json = JSON.parse(file.get_as_text())
	enemies = json.result
	file.close()
	
	var y = 0
	for e in enemies:
		var enemy = load("res://enemies/" + e["type"] + ".tscn").instance()
		enemy.position = Vector2(0, 0)
		enemy.position.y -= (get_viewport_rect().size.y / 2)
		enemy.position.y -= y
		enemy.position.x += e["x"]
		add_child(enemy)
		y += 100

func _process(delta):
	OS.set_window_title("fps: " + str(Engine.get_frames_per_second()) + " | bullets: " + str(get_tree().get_nodes_in_group("enemybullets").size()))
	Engine.get_frames_per_second()
	if(Input.is_action_pressed("quit")):
		get_tree().quit()

