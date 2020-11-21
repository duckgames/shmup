extends Node2D

export var bulletType : String = 'Bullet'
export var xOffset = 0
export var yOffset = 0
export var velocity = 600
export var angle = 180

onready var bullet_resource = load("res://" + bulletType + ".tscn")

func _process(delta):
	self.position = get_parent().position + Vector2(xOffset, yOffset)


func _on_Timer_timeout():
	if (Input.is_action_pressed("player_shoot")):
		var bullet = bullet_resource.instance()
		var rad = deg2rad(angle)
		
		bullet.velocity = velocity
		bullet.angle = angle
		bullet.set_position(self.get_position())
		bullet.xSpeed = cos(rad) * velocity
		bullet.ySpeed = sin(rad) * velocity
		bullet.get_node("Sprite").rotate(deg2rad(angle + 90))
		get_node("/root/GameSceneRoot/Camera2D").add_child(bullet)
