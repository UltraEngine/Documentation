# Display::GetPosition #
This methods retrieves the display position on the virtual display.

## Syntax ##
- [iVec2](iVec2.md) **GetPosition**()

## Returns ##
Returns the display's position on the bounding virtual display.

## Example ##
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	auto displays = GetDisplays();
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
