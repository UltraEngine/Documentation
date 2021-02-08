# Display::GraphicsModes #
This method retrieves the supported full-screen graphics resolutions for this display.

## Syntax ##
- vector<[iVec2](CPP_iVec2.md)\> **GraphicsModes**()

## Returns ##
Returns an array of all supported full-screen graphics resolutions. The native resolution will be the last entry in the array.

## Example ##
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	auto displays = ListDisplays();
	for (int k=0; k < displays.size(); ++k)
	{
		Print("Display " + String(k) + ":");
		Print("	Position: " + String(displays[k]->GetPosition()));
		Print("	Size: " + String(displays[k]->GetSize()));
		Print("	Scale: " + String(displays[k]->GetScale()));
		Print("	Graphics Modes:");
		auto gfxmodes = displays[k]->GraphicsModes();
		for (int n=0; n < gfxmodes.size(); ++n)
		{
			Print("		" + String(n) + ": " + String(gfxmodes[n]));
		}
	}
	return 0;
}
```
