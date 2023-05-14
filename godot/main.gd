extends Main

# these should all be equal to the id of the item that creates them in the add_node_menu items
var node_types : PackedStringArray = [
	"Audio",
	"Marker",
	"SetPlayhead",
	"Scatter",
	"Muxer",
	"Reverb",
	"Mixer",
]

@onready var add_node_menu: MenuButton = $VBoxContainer/HBoxContainer/AddNodeMenu

func _ready() -> void:
	add_node_menu.get_popup().connect("id_pressed", Callable(self, "add_graph_node"))

func add_graph_node(id) -> void:
	on_pressed(node_types[id])
