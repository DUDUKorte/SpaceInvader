extends Area2D

@export var speed : int = 200
@onready var collision_rect: CollisionShape2D = $CollisionShape2D

var direction := Vector2.ZERO
var player_width : int
var win_width : int

# Called when the node enters the scene tree for the first time.
func _ready():
	win_width = get_viewport_rect().size.x
	player_width = collision_rect.shape.get_rect().size.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input = Input.get_axis("move_left","move_right")
	
	# Movement
	if input > 0: direction = Vector2.RIGHT
	elif input < 0: direction = Vector2.LEFT
	else: direction = Vector2.ZERO
	
	position.x += speed * delta * direction.x # Delta Movement / Apply movement
	position.x = clamp(position.x, -(win_width/2)+((player_width/2)*transform.get_scale().x), win_width/2-((player_width/2)*transform.get_scale().x))
