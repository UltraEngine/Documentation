# Display::GraphicsMode #
This method retrieves the supported full-screen graphics resolutions for this display.

## Syntax ##
- vector<[iVec2](CPP_iVec2.md)\> **GraphicsModes**()

## Returns ##
Returns an array of all supported full-screen graphics resolutions. The native resolution will be the last entry in the array.

## Example ##
```c++
#include "pch.h"
#include "Project.h"

int main(int argc, const char* argv[])
{
	auto displays - ListDisplays();
	auto gfxmodes = displays[0]->GraphicsModes();
	for (auto size : gfxmodes)
	{
		Print(size);
	}
	return 0;
}
```
