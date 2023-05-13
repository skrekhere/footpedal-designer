use godot::{prelude::*, engine::{Control, ResourcePreloader, GraphNode, packed_scene::GenEditState, node::InternalMode, GraphEdit}};

#[derive(GodotClass)]
#[class(base=Control)]
pub struct Main {
    node_holder: Option<Gd<ResourcePreloader>>,
    graph_edit: Option<Gd<GraphEdit>>,
    #[base]
    base: Base<Control>
}

#[godot_api]
impl Main {
    #[func]
    fn on_pressed(&mut self, which: GodotString) {
                    let mut name = which.to_string();
                    name.push_str("Node");
                    let audio_node = self.node_holder.as_ref().unwrap().get_resource(name.into()).unwrap().cast::<PackedScene>();
                    let instance = audio_node.instantiate(GenEditState::GEN_EDIT_STATE_INSTANCE).unwrap();
                    let mut graph = instance.cast::<GraphNode>();
                    graph.set_position_offset(Vector2::new(50.0, 50.0));
                    self.graph_edit.as_mut().unwrap().add_child(graph.upcast(), false, InternalMode::INTERNAL_MODE_DISABLED) 
    }

    #[func]
    fn export(&mut self) {
    
    }
}

#[godot_api]
impl NodeVirtual for Main {
    fn init(base: Base<Control>) -> Self {
        Main {
            base,
            node_holder: None,
            graph_edit: None,
        }
    }

    fn ready(&mut self) {
        self.node_holder = Some(self.base.get_node_as("ResourcePreloader"));
        self.graph_edit = Some(self.base.get_node_as("GraphEdit"));
    }
}

