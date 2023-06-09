extends GraphNode

var slots = 1;
# Called when the node enters the scene tree for the first time.
func _ready():
	set_slot(0, true, Globals.CONNECTOR_AUDIOSTREAM, Globals.CONNECTOR_AUDIOSTREAM_COLOUR, true, Globals.CONNECTOR_AUDIOSTREAM, Globals.CONNECTOR_AUDIOSTREAM_COLOUR)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_close_request():
	queue_free() # Replace with function body.


func _on_resize_request(new_minsize):
	custom_minimum_size = new_minsize# Replace with function body.


func _on_button_pressed():
	var new_playhead = $HBoxContainer/HBoxContainer.duplicate()
	new_playhead.get_child(0).text = "Audio In " + str(slots)
	add_child(new_playhead)
	move_child(new_playhead, get_child_count() - 2)
	set_slot(slots, true, Globals.CONNECTOR_AUDIOSTREAM, Globals.CONNECTOR_AUDIOSTREAM_COLOUR, false, Globals.CONNECTOR_DISABLED, Globals.CONNECTOR_DISABLED_COLOUR)
	slots += 1
