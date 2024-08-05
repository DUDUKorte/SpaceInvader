extends Label

var R: float = randf_range(10, 255)
var G: float = randf_range(10, 255)
var B: float = randf_range(10, 255)
var R_return = false
var G_return = false
var B_return = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	add_theme_color_override("font_color", Color8(int(R), int(G), int(B), 255))
	if R>=254: R_return = true
	elif R<=30: R_return = false
	if G>=254: G_return = true
	elif G<=30: G_return = false
	if B>=254: B_return = true
	elif B<=30: B_return = false
	
	R = R + 0.1 if not R_return else R - 0.1
	G = G + 0.1 if not G_return else G - 0.1;
	B = B + 0.1 if not B_return else B - 0.1;
