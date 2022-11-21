# Asset::Save

This method saves the object to a file.

## Syntax

- bool **Save**(const [WString](WString.md)& path, const SaveFlags flags = SAVE_DEFAULT)

| Parameter | Description |
|-|-|
|path| file path to save to |
|flags| optional save flags |

## Returns

Returns true if saving is supported for this object type, and if the object was successfully saved, otherwise false is returned.

## Example

```c++
#include "UltraEngine.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	//Load an asset
	auto pixmap = LoadPixmap("https://github.com/Leadwerks/Documentation/raw/master/Assets/Materials/Brick/brickwall01.dds");

	//Save the asset
	WString path = GetPath(PATH_DOCUMENTS) + "/temp.dds";
	pixmap->Save(path);

	//Open the file
	RunFile(path);

	return 0;
}
```
