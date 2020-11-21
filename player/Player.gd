extends Node2D

export var speed = 300
onready var max_x = get_viewport().size.x / 2
onready var max_y = get_viewport().size.y / 2

var move_vector: Vector2

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_vector = Vector2(0, 0)
	if(Input.is_action_pressed("player_right")):
		move_vector.x = speed * delta
	elif(Input.is_action_pressed("player_left")):
		move_vector.x = -speed * delta
	if(Input.is_action_pressed("player_up")):
		move_vector.y = -speed * delta
	elif(Input.is_action_pressed("player_down")):
		move_vector.y = speed * delta
	
	move_local_x(move_vector.x)
	move_local_y(move_vector.y)

	
	if (self.position.x + move_vector.x > max_x):
		self.position.x = max_x
	elif (self.position.x + move_vector.x < -max_x):
		self.position.x = -max_x
	
	if (self.position.y + move_vector.y > max_y):
		self.position.y = max_y
	elif (self.position.y + move_vector.y < -max_y):
		self.position.y = -max_y


func _on_PlayerRoot_area_entered(area):
	if (area.get_name() == "Enemy"):
		hit()
	elif (area.get_name() == "Item"):
		get_node("PlayerWeaponSystem").level_up()


func hit():
	var weaponNode = get_node("PlayerWeaponSystem")
	if (weaponNode.level > 0):
		weaponNode.level_down()
	else:
		queue_free()
