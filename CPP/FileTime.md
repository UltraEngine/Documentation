# FileTime #
This function returns the last time a file at the specified path was created or modified.

## Syntax ##
- uint64_t **FileTime**(const [WString](WString.md)& path)

| Parameter | Description |
| --- | --- |
| path | file path to read |

## Returns ##
Returns the file time, in units of 100 nanosecond intervals that have elapsed since since 12:00 A.M. January 1, 1601 Coordinated Universal Time (UTC). If the file does not exist then zero is returned.

## Example
```c++
#include "pch.h"

using namespace UltraEngine;

int main(int argc, const char* argv[])
{
  WString path = FolderLocation(FOLDER_DOCUMENTS) + "/temp.txt";

  //Create a new file
  if (!CreateFile(path))
  {
    Print("Failed to write file.");
    return 0;
  }

  uint64_t time = FileTime(path);
  Print("File time: " + String(time));

  return 0;
}
```
