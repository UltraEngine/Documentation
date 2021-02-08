# ListDisplays #
This function retrievs a list of hardware monitors that are currently in use.

## Syntax ##
- vector<shared_ptr<[Display](CPP_Display.md)\> \> **ListDisplays**()

## Returns ##
Returns an array of all displays currently in use, with the primary display in the first index.

## Example ##
```c++
#include "pch.h"
#include "Project.h"

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
