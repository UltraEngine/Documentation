# CreateFileSystemWatcher

This function can be used to create an object that monitors a specified directory for changes.

## Syntax
```csharp
FileSystemWatcher CreateFileSystemWatcher(string path, bool recursive = true)
```

|Parameter|Description|
|---|---|
|path|path to folder to watch|
|recursive|set to true to detect changes to the subdirectory|

## Returns

Returns a new `FileSystemWatcher` object if the specified directory exists, otherwise NULL is returned.

## Remarks

Once the `FileSystemWatcher` object is created, it will monitor the directory to detect changes. When changes occur an event will be emitted. The event ID will be one of the following
- EVENT_FILECREATE
- EVENT_FILEDELETE
- EVENT_FILERENAME
- EVENT_FILECHANGE

## Example

```csharp
using System;
using System.IO;

class Program
{
    static void Main(string[] args)
    {
        // Get the primary display
        var displaylist = GetDisplays();
        var display = displaylist[0];

        // Create a window
        var window = CreateWindow("Ultra Engine", 0, 0, 1280, 720, display, WINDOW_TITLEBAR | WINDOW_CENTER);

        // Download the texture file
        var path = GetPath(PATH_DOCUMENTS) + "/Temp";
        CreateDir(path);
        CopyFile("https://raw.githubusercontent.com/UltraEngine/Documentation/master/Assets/Materials/Ground/dirt01.jpg", path + "/dirt01.jpg");
        OpenDir(path + "/dirt01.jpg");

        // Create FileSystemWatcher to detect changes to files
        var watcher = CreateFileSystemWatcher(path);

        var plugin = LoadPlugin("Plugins/FITextureLoader");
        var ui = CreateInterface(window);
        var panel = CreatePanel(0, 0, window.ClientSize().X, window.ClientSize().Y, ui.root);
        panel.SetPixmap(LoadPixmap(path + "/dirt01.jpg"));

        // Main loop
        while (!window.Closed())
        {
            //Check for file change events
            var e = WaitEvent();

            //Look for file change or create events. Some programs delete the file and then recreate it when they save.
            if (e.id == EVENT_FILECHANGE || e.id == EVENT_FILECREATE)
            {
                //Look for a loaded asset with this file path
                var asset = FindCachedAsset(e.text);
                if (asset != null)
                {
                    //Reload the modified asset
                    asset.Reload();
                    panel.Redraw();
                }
            }
        }
    }
}
```