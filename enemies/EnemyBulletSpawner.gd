extends Node2D

export var bulletType : String = 'EnemyBullet'
export var xOffset = 0
export var yOffset = 0
export var velocity = 300
export var angle = 90
export var rotationSpeed = 0

onready var bullet_resource = load("res://enemies/" + bulletType + ".tscn")

func get_class():
	return "EnemyBulletSpawner"

func _ready():
	self.position += Vector2(xOffset, yOffset)
	
func _process(delta):
	self.rotate(rotationSpeed * delta)

func _on_Timer_timeout():
	var bullet = bullet_resource.instance()
	bullet.velocity = velocity
	bullet.angle = angle + self.rotation
	bullet.position = get_parent().position + self.position
	var rad = deg2rad(bullet.angle)
	bullet.xSpeed = cos(rad) * velocity
	bullet.ySpeed = sin(rad) * velocity
	bullet.get_node("Sprite").rotate(deg2rad(angle + 90))
	var node = get_node("/root/GameSceneRoot").add_child(bullet)
	call_deferred("node.add_child", bullet)
