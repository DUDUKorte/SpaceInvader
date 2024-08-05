extends Node2D

@export var laser_scene : PackedScene
var can_player_shoot : bool = true

func _input(event):
	if Input.is_action_just_pressed("shoot") and can_player_shoot:
		can_player_shoot = false
		var laser = laser_scene.instantiate() as Laser
		laser.global_position = get_parent().global_position - Vector2(0, 20) # - offset
		get_tree().root.add_child(laser)
		laser.tree_exited.connect(on_laser_destroy)

func on_laser_destroy():
	can_player_shoot = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
