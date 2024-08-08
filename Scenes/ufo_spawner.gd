extends Node2D

@onready var spawn_timer = $SpawnTimer
var ufo_scene : PackedScene = preload("res://Scenes/ufo.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_timer.setup_timer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_spawn_timer_timeout():
	var ufo = ufo_scene.instantiate()
	ufo.global_position = position
	get_tree().root.add_child(ufo)
