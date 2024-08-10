# Building Blocks

## Nodes
Nodes are the fundamental building blocks of a Godot project. Every game object, control system, and scene is made of a nested collection of Nodes. Nodes come in many types and are the main way to access the features of Godot Engine. They are kind of like a mix of a GameObject and a Component from Unity, but each node only has a single Component to it. Some examples would be Node2D, RigidBody2D, AnimatedSprite2D, AnimationPlayer, TileMap, AudioStreamPlayer, or Timer.

## Scenes
Scenes in Godot are effectively just a re-usable Node Tree. They always require a single root node (of any type) and within that can contain (almost) any number of child structures. Scenes can also be nested within other node structures and other scenes, since they have the root node. They can be saved to a file with the `*.tscn` extension. Scenes can be used for creating levels in a game or menu screens, but are also the primary way to build custom nodes, like player objects, environmental elements, interactable objects, and even re-usable components like Kill Triggers. Another way to imagine a Scene similar to conventional programming is as a *Class* that is *Composed* of other classes. They define a template of an object which can be instantiated within other Scenes.

## Signals
Signals are Godot's central implementation of the Observer pattern. Essentially different node types provide a variety of different "signals" which can be "connected" to functions in scripts on other nodes. A signal can be used to both indicate that an event has happened *and* provide data to the connected listener.