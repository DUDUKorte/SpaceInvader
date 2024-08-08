extends Timer

class_name SpawnTimer

@export var min_time : int = 5
@export var max_time : int = 10 

# Called when the node enters the scene tree for the first time.
func _ready():
	setup_timer()

func setup_timer():
	var random_time = randi_range(min_time, max_time)
	self.wait_time = random_time
	self.stop()
	self.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
