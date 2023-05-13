extends ResourcePreloader


# Called when the node enters the scene tree for the first time.
func _ready():
	add_resource("AudioNode", preload("res://Nodes/Audio.tscn"))
	add_resource("MarkerNode", preload("res://Nodes/Marker.tscn"))
	add_resource("SetPlayheadNode", preload("res://Nodes/SetPlayhead.tscn"))
	add_resource("ScatterNode", preload("res://Nodes/Scatter.tscn"))
	add_resource("MuxerNode", preload("res://Nodes/Muxer.tscn"))
	add_resource("ReverbNode", preload("res://Nodes/Reverb.tscn"))
	add_resource("MixerNode", preload("res://Nodes/Mixer.tscn"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
