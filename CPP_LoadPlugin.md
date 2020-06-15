# LoadPlugin #
This function loads a plugin module. The plugin's functionality will be available immediately. When the plugin object goes out of scope it will be deleted, and its functionality will no longer be available.

## Syntax ##
- shared_ptr<[Plugin](API_Plugin.md)\> LoadPlugin(const string& path)
- shared_ptr<[Plugin](API_Plugin.md)\> LoadPlugin(const wstring& path)

| Parameter | Description |
| ----- | ----- |
| path | File name of the module to load. |

## Remarks ##
The file extension of plugin modules varies by platform. On Windows the extension ".dll" is used. On MacOS the extension ".dylib" is used.
On Linux the extension ".so" is used. You can use an asterisk (.*) for the file extension and the engine will select the correct file extension based on the current platform.

## Example ##
```c++
```
