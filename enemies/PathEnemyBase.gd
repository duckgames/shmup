extends "EnemyBase.gd"

func _process(delta):
	get_parent().set_offset(get_parent().get_offset() + (200 * delta))
