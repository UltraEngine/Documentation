# LoadDir #
This function loads the contents of a directory and returns an array of files.

## Syntax ##
- vector<[WString](WString.md)> **LoadDir**(const [WString](WString.md)& path)

## Returns ##
Returns an array of file names found within the directory. The array will be empty if the specified path contains no files, or if the folder contains no files.
 
 ## Example
 ```c++
 #include "pch.h"
 
using namespace UltraEngine;
 
int main(int argc, const char* argv[])
{
    WString path = "C:/Windows";

    auto dir = LoadDir(path);
    for (auto file : dir)
    {
        Print(file);
    }
    return 0;
}
 ```
