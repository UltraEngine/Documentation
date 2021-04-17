# DownloadFile
This function downloads a file from a web server and saves it to the user's hard drive.

## Syntax 
- bool **DownloadFile**(const [WString](WString.md)& src, const [WString](WString.md)& dest)

| Parameter | Description |
|---|---|
| src | URL of the file to download |
| dest | local file path to save to |

## Returns
Returns true if the download succeeds, otherwise false is returned.

## Remarks
Downloaded files are stored in a local cache. You do not need to implement an additional caching system.

## Example
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	WString src = "https://raw.githubusercontent.com/Leadwerks/Documentation/master/Images/ultraengine_logo.png";
	WString dst = GetPath(PATH_DOCUMENTS) + "/temp.png";

	Print("Downloading...");
	if (DownloadFile(src,dst))
	{
		Print("Download complete.");
		RunFile(dst);
	}
	else
	{
		Print("Failed to download file.");
	}
	return 0;
}
```