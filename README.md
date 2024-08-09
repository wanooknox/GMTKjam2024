# GMTK Game Jam 2024

## Quick Links
* [Design Doc](./planning/design-doc.md)
* [Meeting Notes](./planning/meeting-notes/)

## Organization
Design docs and meeting notes go in the [planning](./planning/) folder. Project code and game assets are kept in the [project](./project/) folder. Any assets that are in progress or not yet final (e.g. files for art/audio) go in [assets](./assets/).

## Setup
* [Download Godot](https://godotengine.org/download) - version 4.2.2 is latest (Both .NET and Original flavour will work, but .NET is required for C#)
* [Download VS Code](https://code.visualstudio.com/download) - if you don't want to use the built in text editor in Godot. See below for instructions to configure the default text editor.

### Setting External Text Editor in Godot
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