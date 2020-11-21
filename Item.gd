extends Node2D

func _ready():
	get_node("CollisionShape2D").shape.extents = get_node("Sprite").get_rect().size


func get_name():
	return "Item"
	

func _on_Area2D_area_entered(area):
	queue_free()
