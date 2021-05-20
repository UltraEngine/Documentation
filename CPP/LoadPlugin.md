# LoadPlugin #
This function loads a plugin module. The plugin's functionality will be available immediately. When the plugin object goes out of scope it will be deleted, and its functionality will no longer be available.

## Syntax ##
- shared_ptr<[Plugin](Plugin.md)\> LoadPlugin(const [WString](WString.md)& path, const LoadFlags flags = LOAD_DEFAULT)

| Parameter | Description |
| ----- | ----- |
| path | file path of the module to load |
| flags | optional load settings |

## Remarks ##
The file extension of plugin modules varies by platform. You can use an asterisk (\*) for the file extension and the engine will select the correct file extension based on the current platform.

## Example ##
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
#ifdef _WIN64
	auto plugin = LoadPlugin("Plugins/FITextureLoader.*");
#else
	auto plugin = LoadPlugin("Plugins/x86/FITextureLoader.*");
#endif

	if (plugin)
	{
		Print(plugin->description);
	}
	else
	{
		Print("Failed to load plugin.");
	}
	return 0;
}
```
