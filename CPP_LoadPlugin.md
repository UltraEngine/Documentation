# LoadPlugin #
This function loads a plugin module. The plugin's functionality will be available immediately. When the plugin object goes out of scope it will be deleted, and its functionality will no longer be available.

## Syntax ##
- shared_ptr<[Plugin](API_Plugin.md)\> LoadPlugin(const WString& path)

| Parameter | Description |
| ----- | ----- |
| path | file path of the module to load |

## Remarks ##
The file extension of plugin modules varies by platform. You can use an asterisk (.\*) for the file extension and the engine will select the correct file extension based on the current platform.

## Example ##
```c++
```
