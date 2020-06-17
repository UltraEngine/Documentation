# Plugin #

**Base Class:** [Asset](API_Asset.md)

This class provides an interface by which modular functionality can be added to the engine. Plugins can be used to add support for loading and saving new file and package formats, and for converting image data between pixel formats.

| Property | Type | Description |
| ----- | ----- | ----- |
| description | const wstring& | Read-only description of functionality loaded from the plugin. |
| title | const wstring& | Read-only title loaded from plugin. |
| [LoadPlugin](API_LoadPlugin.md) | Function | Loads a plugin module. |


