# CreateFileSystemWatcher #
This function can be used to create an object that monitors a specified directory for changes.

## Syntax
- shared_ptr<[FileSystemWatcher](FileSystemWatcher.md)\> **CreateFileSystemWatcher**(const [WString](WString.md)& path, const bool recursive = true)

|Parameter|Description|
|---|---|
|path|path to folder to watch|
|recursive|set to true to detect changes to the subdirectory|

## Returns

Returns a new FileSystemWatcher object if the specified directory exists, otherwise NULL is returned.

## Remarks

Once the FileSystemWatcher object is created, it will monitor the directory to detect changes. When changes occur an event will be emitted. The event ID will be one of the following
- EVENT_FILECREATE
- EVENT_FILEDELETE
- EVENT_FILERENAME
- EVENT_FILECHANGE

## Example

```c++
#include "pch.h"

using namespace UltraEngine;

//---------------------------------------------------------------------------------------------------
// This example demonstrates use of a FileSystemWatcher to allow dynamic asset reloading.
// Run the example and modify the texture file in a paint program to see your changes appear as the program is running.
//---------------------------------------------------------------------------------------------------

int main(int argc, const char* argv[])
{
    // Get the primary display
    auto displaylist = GetDisplays();
    auto display = displaylist[0];

    // Create a window
    auto window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, display, WINDOW_TITLEBAR | WINDOW_CENTER);

    // Download the texture file
    CreateDir("Download");
    CopyFile("https://raw.githubusercontent.com/Leadwerks/Documentation/master/Assets/Materials/Ground/dirt01.jpg", "Download/dirt01.jpg");
    OpenDir("Download/dirt01.jpg");

    //Create FileSystemWatcher to detect changes to files
    auto watcher = CreateFileSystemWatcher("Download");

    // Main loop
    while (window->Closed() == false)
    {
        //Check for file change events
        auto e = WaitEvent();

        //Look for file change or create events. Some programs delete the file and then recreate it when they save.
        if (e.id == EVENT_FILECHANGE or e.id == EVENT_FILECREATE)
        {
            //Cast event.extra to a WString   
            shared_ptr<WString> filepathptr = e.extra->As<WString>();
            
            //Convert the shared pointer into an object
            WString filepath = *filepathptr.get();

            //Look for a loaded asset with this file path
            auto asset = FindCachedAsset(filepath);
            if (asset)
            {
                //Reload the modified asset
                asset->Reload();
            }
        }
    }
    return 0;
}
```
