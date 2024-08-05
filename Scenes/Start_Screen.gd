extends CanvasLayer

@onready var invder_container_1 = %InvderContainer1
@onready var invder_container_2 = %InvderContainer2
@onready var invder_container_3 = %InvderContainer3

@onready var control_array = [invder_container_1,
							invder_container_2,
							invder_container_3]

@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	for control in control_array:
		(control as CanvasItem).modulate.a8 = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _start_game_on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

func _on_timer_timeout_show_next_container():
	var control = control_array.pop_front()
	if control:
		control.modulate.a8 = 255
	else:
		timer.stop()
		timer.queue_free()
