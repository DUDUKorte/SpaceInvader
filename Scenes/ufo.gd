extends Area2D

class_name UFO

@export var speed : int = 200
@onready var sprite_2d = $Sprite2D
@onready var shooting_point = $ShootingPoint
@onready var shot_timer = $ShotTimer
var ufo_shot_scene : PackedScene = preload("res://Scenes/invader_shot.tscn")
var explosion_texture = preload("res://Assets/Ufo/Ufo-explosion.png")
var can_shoot : bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	shot_timer.setup_timer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= delta * speed

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_shot_timer_timeout():
	if can_shoot:
		var ufo_shot = ufo_shot_scene.instantiate() as InvaderShot
		(ufo_shot.get_node("Sprite2D") as Sprite2D).modulate = Color(.67, .2, .2, 1)
		ufo_shot.global_position = shooting_point.global_position
		get_tree().root.add_child(ufo_shot)

func _on_area_entered(area):
	if area is Laser:
		shooting_point.queue_free()
		can_shoot = false
		speed = 0
		sprite_2d.texture = explosion_texture
		await get_tree().create_timer(1.5).timeout
		queue_free()
		
