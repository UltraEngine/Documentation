# Plugin

**Base class**: Asset

This class provides an interface by which modular functionality can be added to Leadwerks 5. Plugins can be used to add support for loading and saving new file and package formats, and for converting image data between pixel formats. New plugins can be created with the plugin SDK.

Plugins will be utilized automatically by the engine as the program runs. For example, when an unknown model format is loaded, the data will be passed to all plugins that contain a LoadModel function, until one is found that recognizes the data.

When a plugin is deleted it will be automatically unloaded and its functionality will no longer be available to the engine. Therefore, you must maintain a variable for a loaded plugin and not let it go out of scope using the LoadPlugin function.

```lua
local plugin_freeimage = LoadPlugin("Plugins/FITextureLoader")
```

| Property | Type | Description |
| --- | --- | --- |
| description | const WString& | read-only description of functionality loaded from the plugin |
| title | const WString& | read-only title loaded from plugin |
| properties | table | JSON structure containing plugin information |
| LoadPlugin | Function | loads a plugin module |

## Stock Plugins

The following plugins are provided:

| Name | Description |
|---|---|
| FITextureLoader | Loads and saves many image formats including JPEG, PNG, BMP, PSD, TGA, GIF, HDR, and EXR |
| ISPCTexComp | Provides fast BC5, BC6, and BC7 pixmap format conversion |
| KTX2TextureLoader | Loads and saves Khronos KTX2 texture files |

## Plugin SDK

The [Ultra Engine Plugin SDK](https://github.com/UltraEngine/PluginSDK) allows modular functionality to be added to the engine.

### Overview

A plugin can be loaded by any Ultra Engine application using the LoadPlugin command. Plugins must be compiled separately for each supported platform.
Windows uses DLL files for plugins. MacOS uses DYLIB files. Linux uses SO files. You can omit the file extension in the plugin file path, and the engine will choose a file extension based on the current platform:

```lua
LoadPlugin("Plugins/FITextureLoader");
```

A plugin is only required to have one function called "GetPluginInfo". This will return a string in JSON format containing information about the plugin. A top-level plugin object must be specified. This object is required to have string elements for "title" and "description". You can optionally include some text about the author:

```lua
{
  "plugin":
  {
    "title": "Plugin Title",
    "description": "Description of the plugin and its functionality.",
    "author": "John Smith"
  }
}
```

### Properties

Other miscellaneous properties can be added to tell the engine how to handle the plugin.

| Property | Type | Description |
| --- | --- | --- |
| collapseSavedModels | boolean | if set to true models will be collapsed before SaveModel is called |
| redistributable | boolean | indicates whether the plugin can be redistributed in a game or application, defaults to true |
| saveModelExtensions | string or array | file format extensions supported for model saving |
| saveModelFilter | string | file type filter for save file dialogs |
| saveTextureExtensions | string or array | file format extensions supported for texture saving |
| saveTextureFilter | string | file type filter for save file dialogs |

### Functions

The plugin's functionality is defined by the functions it contains. A plugin can contain any of the following functions. It is possible to combine functionality, like a plugin that
can save model files and load a new texture format. However, it is best to limit plugins to a single purpose, or a single file format, like loading and saving of a new image format.

| Function | Description |
| --- | --- |
| GetPluginInfo | Required function that returns information about the plugin. |
| ConvertPixmap | Converts pixel data between formats. |
| LoadTexture | Loads an image from memory in a specific format. |
| SaveTexture | Saves an image to memory in a specific format. |
| Cleanup | Called after load and save commands to free allocated resources. |

A package plugin must contain all of the following commands:

| Function | Description |
| --- | --- |
| LoadPackage | Loads a model from memory in a specific format. |
| CountPackageFiles | Loads a model from memory in a specific format. |
| GetPackageFileSize | Loads a model from memory in a specific format. |
| LoadPackageFile | Loads a model from memory in a specific format. |
| FreePackage | Loads a model from memory in a specific format. |
| GetPackageFileName | Loads a model from memory in a specific format. |