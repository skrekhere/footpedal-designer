extends Control

var node_types : PackedStringArray = [
	"Audio",
	"Marker",
	"SetPlayhead",
	"Scatter",
	"Muxer",
	"Reverb",
	"Mixer",
]

@onready var add_node_menu: MenuButton = $HBoxContainer/AddNode

func _ready() -> void:
	add_node_menu.get_popup().connect("id_pressed", Callable(self, "add_graph_node"))

func add_graph_node(id) -> void:
	on_pressed(self, node_types[id])
