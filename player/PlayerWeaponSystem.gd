extends Node2D

export var spawnerType : String = 'PlayerBulletSpawner'

onready var spawner_resource = load("res://player/" + spawnerType + ".tscn")

var level = 4
var max_level = 4

var levels = {}

func _ready():
	var leftSpawner = spawner_resource.instance()
	var rightSpawner = spawner_resource.instance()
	var centreSpawner = spawner_resource.instance()
	var leftDiagSpawner = spawner_resource.instance()
	var rightDiagSpawner = spawner_resource.instance()
	var leftSideSpawner = spawner_resource.instance()
	var rightSideSpawner = spawner_resource.instance()
	
	leftSpawner.xOffset = -15
	leftSpawner.angle = 270
	rightSpawner.xOffset = 15
	rightSpawner.angle = 270
	
	centreSpawner.angle = 270
	
	leftDiagSpawner.angle = 240
	leftDiagSpawner.xOffset = -20
	rightDiagSpawner.angle = 300
	rightDiagSpawner.xOffset = 20
	
	leftSideSpawner.angle = 180
	leftSideSpawner.xOffset = -20
	rightSideSpawner.angle = 0
	rightSideSpawner.xOffset = 20

	levels[0] = [leftSpawner, rightSpawner]
	levels[1] = [leftSpawner, rightSpawner, centreSpawner]
	levels[2] = [leftSpawner, rightSpawner, leftDiagSpawner, rightDiagSpawner]
	levels[3] = [leftSpawner, rightSpawner, leftDiagSpawner, rightDiagSpawner, leftSideSpawner, rightSideSpawner]
	levels[4] = [leftSpawner, rightSpawner, centreSpawner, leftDiagSpawner, rightDiagSpawner, leftSideSpawner, rightSideSpawner]
	
	for l in levels[4]:
		self.add_child(l)


func _process(delta):
	self.position = get_parent().position


func level_up():
	if (level < max_level):
		for node in self.get_children():
			self.remove_child(node)
		
		level += 1
		for l in levels[level]:
			self.add_child(l)


func level_down():
	if (level > 0):
		for node in self.get_children():
			self.remove_child(node)
		
		level -= 1
		for l in levels[level]:
			self.add_child(l)
