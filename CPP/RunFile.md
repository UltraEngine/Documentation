# RunFile #
Executes a file with the default system file handler for this file type. This can be used to open an image, text file, or other known file type, or to open a URL in the default web browser.

## Syntax ##
- bool **RunFile**(const [WString](WString.md)& path)

### Parameters ###
| Name | Description |
|---|---|
| path | file path to execute |

## Returns ##
Returns true if the file exists and was executed, otherwise false is returned.

## Example ##
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
	RunFile("https://www.ultraengine.com");
	return 0;
}

```