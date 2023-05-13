use godot::prelude::*;

mod base;

struct FootPedalDesigner;

#[gdextension]
unsafe impl ExtensionLibrary for FootPedalDesigner {}

#[cfg(test)]
mod tests {
    use super::*;
}
