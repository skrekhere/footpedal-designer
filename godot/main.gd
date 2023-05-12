extends Control

var audio_node = load("res://Nodes/Audio.tscn")
var marker_node = load("res://Nodes/Marker.tscn")
var set_playhead_node = load("res://Nodes/SetPlayhead.tscn")
var scatter_node = load("res://Nodes/Scatter.tscn")
var muxer_node = load("res://Nodes/Muxer.tscn")
var reverb_node = load("res://Nodes/Reverb.tscn")
var mixer_node = load("res://Nodes/Mixer.tscn")
var initial_position = Vector2(40, 40)
var node_count = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_button_pressed():
	var node = audio_node.instantiate()
	node.position_offset += initial_position + (node_count * Vector2(20, 20))
	node_count += 1
	$GraphEdit.add_child(node)# Replace with function body.


func _on_graph_edit_connection_request(from_node, from_port, to_node, to_port):
	$GraphEdit.connect_node(from_node, from_port, to_node, to_port)


func _on_graph_edit_disconnection_request(from_node, from_port, to_node, to_port):
	$GraphEdit.disconnect_node(from_node, from_port, to_node, to_port) # Replace with function body.


func _on_button_2_pressed():
	var node = marker_node.instantiate()
	node.position_offset += initial_position + (node_count * Vector2(20, 20))
	node_count += 1
	$GraphEdit.add_child(node)
	


func _on_button_3_pressed():
	var node = set_playhead_node.instantiate()
	node.position_offset += initial_position + (node_count * Vector2(20, 20))
	node_count += 1
	$GraphEdit.add_child(node)


func _on_button_4_pressed():
	var node = scatter_node.instantiate()
	node.position_offset += initial_position + (node_count * Vector2(20, 20))
	node_count += 1
	$GraphEdit.add_child(node)


func _on_button_5_pressed():
	var node = muxer_node.instantiate()
	node.position_offset += initial_position + (node_count * Vector2(20, 20))
	node_count += 1
	$GraphEdit.add_child(node)


func _on_button_6_pressed():
	var node = reverb_node.instantiate()
	node.position_offset += initial_position + (node_count * Vector2(20, 20))
	node_count += 1
	$GraphEdit.add_child(node)


func _on_button_7_pressed():
	var node = mixer_node.instantiate()
	node.position_offset += initial_position + (node_count * Vector2(20, 20))
	node_count += 1
	$GraphEdit.add_child(node)
