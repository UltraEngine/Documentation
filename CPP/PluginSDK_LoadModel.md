# LoadModel (Plugin Function) #
This plugin function will load a model from memory. When an unknown model file format is encountered, the engine will pass the file data to all plugins that include this function.

It's best for the plugin to attempt to determine the file type by reading the file contents and only use the file path extension as a last resort.

The engine will automatically call the [Cleanup](PluginSDK_Cleanup) plugin function following this function call, regardless of the return value.

## Syntax ##
- void\* **LoadModel**(void\* data, uint64_t size, const wchar_t* filename, uint64_t& returnsize)

| Parameter | Description |
| ----- | ----- |
| data | Pointer to file contents to load. |
| size | Size of the file contents, in bytes. |
| filename | File path the data was loaded from. This may be empty. |
| returnsize | Pointer to a variable to store the size of the returned data. |

## Returns ##
If the plugin is able to load a model from the file data this function should return a pointer to a GMFFile object, and the size of the object should be copied to the returnsize variable. If the plugin cannot load a model then NULL should be returned.