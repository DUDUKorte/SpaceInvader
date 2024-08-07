extends Area2D

class_name InvaderShot

@export var speed = 200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed * delta


func _on_area_entered(area):
	if area is Player:
		(area as Player).on_player_destroy()
		queue_free()
