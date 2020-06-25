# Plugin SDK #
The Leadwerks 5 plugin SDK allows modular functionality to be added to the engine.

## Plugin Overview ##
A plugin can be loaded by any Leadwerks 5 program using the [LoadPlugin](API_LoadPlugin.md) command. Plugins must be compiled separately for each supported platform.
Windows uses DLL files for plugins. MacOS uses DYLIB files. Linux uses SO files. You can use an asterisk for the file extension in the LoadPlugin command, and the engine will choose a file extension based on the current platform:

```c++
LoadPlugin("Plugins/Basis.*");
```

A plugin is only required to have one function called "GetPluginInfo". This will return a string in JSON format containing information about the plugin. The JSON string is required to have the following elements:

```json
{
  "title": "Plugin Title",
  "description": "Description of the plugin and its functionality."
}
```

The plugin's functionality is defined by the functions it contains. A plugin can contain any of the following functions. It is possible to combine functionality, like a plugin that
can save model files and load a new texture format. However, it is best to limit plugins to a single purpose, or a single file format, like loading and saving of a new image format.

| Function | Description |
| ---- | ---- |
| [LoadModel]() | Loads a model from memory in a specific format. |
| [SaveModel]() | Saves a model to memory in a specific format. |
| [ConvertPixmap]() | Converts pixel data between formats. |
| [LoadTexture]() | Loads an image from memory in a specific format. |
| [SaveTexture]() | Saves an image to memory in a specific format. |
| [Cleanup]() | Called after load and save commands to free allocated resources. |

A package plugin is different in that it must contain a set of commands in order to work:

| Function | Description |
| ---- | ---- |
| LoadPackage | Loads a model from memory in a specific format. |
| CountPackageFiles | Loads a model from memory in a specific format. |
| GetPackageFileSize | Loads a model from memory in a specific format. |
| LoadPackageFile | Loads a model from memory in a specific format. |
| FreePackage | Loads a model from memory in a specific format. |
| GetPackageFileName | Loads a model from memory in a specific format. |

Plugins will be utilized automatically by the engine as the program runs. For example, when an unknown model format is loaded, the data will be passed to all plugins that contain a LoadModel function, until one is found that recognizes the data.

When a plugin is deleted it will be automatically unloaded and its functionality will no longer be available to the engine. Therefore, you must maintain a variable for a loaded plugin and not let it go out of scope. One way of doing this is to place a Lua script in the "Scripts\\Start\\Autoload" folder that loaded the plugin and stores it in a global variable. For example, you could create a script called "Scripts\\Start\\Autoload\\Basis.lua" with these contents:
```lua
PLUGIN_BASIS = LoadPlugin("Plugins/Basis.*")
```
The script will be automatically run every time your program starts and the plugin will be loaded.
