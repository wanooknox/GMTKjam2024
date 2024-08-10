# GMTK Game Jam 2024

## Quick Links
* [Design Doc](./planning/design-doc.md)
* [Meeting Notes](./planning/meeting-notes/)
* [Task Board](https://github.com/users/wanooknox/projects/1/views/1)

## Organization
Design docs and meeting notes go in the [planning](./planning/) folder. Project code and game assets are kept in the [project](./project/) folder. Any assets that are in progress or not yet final (e.g. files for art/audio) go in [assets](./assets/).

## Setup
* [Download Godot](https://godotengine.org/download) - version 4.2.2 is latest (Both .NET and Original flavour will work, but .NET is required for C#)
* [Download VS Code](https://code.visualstudio.com/download) - if you don't want to use the built in text editor in Godot. [See below](#setting-external-text-editor-in-godot) for instructions to configure the default text editor.

## Useful Resources
* [Godot Crash Course](./GodotCrashCourse.md) - My little write up of the core concepts
* [Brackeys How to Make a Game](https://www.youtube.com/watch?v=LOhfqjmasi0) - YT - 1hr run down of making a platformer in godot
* [Brackeys How to GDScript](https://www.youtube.com/watch?v=e1zJS31tr88) - YT - 1hr gdscript quick start
* [Official Godot Docs](https://docs.godotengine.org/en/stable/index.html)
  * [Primary Lifecycle Hooks](https://docs.godotengine.org/en/stable/tutorials/scripting/overridable_functions.html) - the main overridable methods that can be implemented in a Node's script (for initialization, update, physics update, etc.)
  * [Creating custom signals](https://docs.godotengine.org/en/stable/getting_started/step_by_step/signals.html#custom-signals) - you can add custom signals to a Node's script which can trigger behaviour elsewhere. Please type your params... `signal foo(bar: int)`
  * [Accessing nodes in scripts](https://docs.godotengine.org/en/stable/tutorials/scripting/nodes_and_scene_instances.html) - describes functions for getting node references, syntax sugars for accesing nodes by "path", and also how to instanciate scenes at run time
  * [Instanciate thru signals](https://docs.godotengine.org/en/stable/tutorials/scripting/instancing_with_signals.html) - when you need to instanciate something without making it a child of the current node (e.g. projectiles)
  * [Pausing](https://docs.godotengine.org/en/stable/tutorials/scripting/pausing_games.html)
  * [User Interface](https://docs.godotengine.org/en/stable/tutorials/ui/index.html) - overview of Godot's UI Control Node tools
  * [Class Reference](https://docs.godotengine.org/en/stable/classes/index.html) - API doc of all classes in Godot

## Setting External Text Editor in Godot
1. Open the Editor Settings
2. Select Text Editor > External
3. Make sure the Use External Editor box is checked
4. Set Exec Path to the path to your VS Code executable
   * On Windows: `C:/Program Files/Microsoft VS Code/Code.exe`
   * On macOS, this executable is typically located at: `/Applications/Visual Studio Code.app/Contents/MacOS/Electron`
5. Set Exec Flags to `{project} --goto {file}:{line}:{col}`

Some recommended extensions if using VS Code with Godot:
* https://marketplace.visualstudio.com/items?itemName=geequlim.godot-tools
* https://marketplace.visualstudio.com/items?itemName=neikeq.godot-csharp-vscode