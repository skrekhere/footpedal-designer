extends GraphNode


# Called when the node enters the scene tree for the first time.
func _ready():
	set_slot(0, true, Globals.CONNECTOR_TIMESTAMP, Globals.CONNECTOR_TIMESTAMP_COLOUR, true, Globals.CONNECTOR_AUDIOSTREAM, Globals.CONNECTOR_AUDIOSTREAM_COLOUR) # Replace with function body.
	set_slot(1, true, Globals.CONNECTOR_TIMESTAMP, Globals.CONNECTOR_TIMESTAMP_COLOUR, true, Globals.CONNECTOR_SIGNAL, Globals.CONNECTOR_SIGNAL_COLOUR)
	set_slot(2, true, Globals.CONNECTOR_TIMESTAMP, Globals.CONNECTOR_TIMESTAMP_COLOUR, true, Globals.CONNECTOR_SIGNAL, Globals.CONNECTOR_SIGNAL_COLOUR)
	set_slot(3, true, Globals.CONNECTOR_TIMESTAMP, Globals.CONNECTOR_TIMESTAMP_COLOUR, false, Globals.CONNECTOR_DISABLED, Globals.CONNECTOR_DISABLED_COLOUR)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_close_request():
	queue_free() # Replace with function body.


func _on_resize_request(new_minsize):
	custom_minimum_size = new_minsize# Replace with function body.
