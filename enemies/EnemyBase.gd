extends Area2D

signal enemyhit

export var velocity : float = 48.0
export var angle : float = 90.0

var entered: bool = false

onready var xSpeed : float = cos(deg2rad(angle)) * velocity
onready var ySpeed : float = sin(deg2rad(angle)) * velocity

func _ready():
	set_process(false)
	

func _process(delta):
	self.position.x += xSpeed * delta
	self.position.y += ySpeed * delta

func get_name():
	return "Enemy"
	
func hit():
	queue_free()


func _on_Area2D_area_entered(area):
	hit()


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	# The enemy will spawn just outside the viewport, resulting in this being 
	# called immediately after _on_VisibilityNotifier2D_viewport_entered.
	# So, on the first call, set entered = true. On the second call (the real
	# exit) call queue_free().
	if (entered):
		queue_free()
	else:
		entered = true


func _on_VisibilityNotifier2D_viewport_entered(viewport):
	entered = true
	
	for child in get_children():
		if child.get_class() == "EnemyBulletSpawner":
			child.get_node("Timer").start()

	set_process(true)
