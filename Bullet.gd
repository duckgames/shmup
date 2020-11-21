extends Node2D

export var velocity : float = 128.0
export var angle : float = 0.0

var xSpeed : float
var ySpeed : float

func _process(delta):
	self.position.x += xSpeed * delta
	self.position.y += ySpeed * delta
		
	if($RayCast2D.is_colliding()):
		var collider = get_node("RayCast2D").get_collider()
		if (collider != null):
			collider.hit()
		queue_free()
	

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
