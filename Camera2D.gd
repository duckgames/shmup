extends Camera2D

export var speed = -128

func _process(delta):
	var position = self.position
	position.y += speed * delta
	self.position = position
