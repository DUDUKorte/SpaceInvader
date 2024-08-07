extends Area2D

class_name Invader

@onready var animation_player = $AnimationPlayer
@onready var sprite_2d = $Sprite2D
var config : Resource

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_2d.texture = config.sprite
	animation_player.play(config.animation_name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite_2d.modulate = config.color

func _on_area_entered(area):
	if area is Laser:
		animation_player.play("destroy")
		area.queue_free()


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "destroy":
		queue_free()
