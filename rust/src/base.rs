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
                    let audio_node = match self.node_holder.as_ref() {
                        Some(holder) => match holder.get_resource(name.clone().into()) {
                            Some(resource) => match resource.try_cast::<PackedScene>(){
                                Some(scene) => scene,
                                None => {
                                    godot::log::godot_error!("Could not cast node to PackedScene!");
                                    return;
                                }
                            }, 
                            None => {
                                godot::log::godot_error!("{} was not a resource!", name);
                                return;
                            }
                        },
                        None => {
                            godot::log::godot_error!("Node holder did not exist!");
                            return;
                        }
                    };
                    let instance = match audio_node.instantiate(GenEditState::GEN_EDIT_STATE_INSTANCE) {
                        Some(inst) => inst,
                        None => {
                            godot::log::godot_error!("Could not instantiate node!");
                            return;
                        }
                    };
                    let mut graph = match instance.try_cast::<GraphNode>() {
                        Some(graph) => graph,
                        None => {
                            godot::log::godot_error!("Could not cast node to GraphNode!");
                            return;
                        }
                    };
                    graph.set_position_offset(Vector2::new(50.0, 50.0));
                    match self.graph_edit.as_mut() {
                        Some(graph_edit) => graph_edit.add_child(graph.upcast(), false, InternalMode::INTERNAL_MODE_DISABLED),
                        None => {
                            godot::log::godot_error!("Graph Edit did not exist!");
                            return;
                        }
                    }
    }

    #[func]
    fn export(&mut self) {
    
    }


    #[func]
    fn rs_ready(&mut self) {
        self.node_holder = Some(self.base.get_node_as("ResourcePreloader"));
        self.graph_edit = Some(self.base.get_node_as("VBoxContainer/GraphEdit"));
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
}

