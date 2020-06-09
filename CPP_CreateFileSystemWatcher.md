# CreateFileSystemWatcher #
This function can be used to create an object that monitors a specified directory for changes.

## Syntax ##
- shared_ptr<[FileSystemWatcher](CPP_FileSystemWatcher.md)\> **CreateFileSystemWatcher**(const string& path);
- shared_ptr<[FileSystemWatcher](CPP_FileSystemWatcher.md)\> **CreateFileSystemWatcher**(const wstring& path);

### Parameters ###
|Name|Description|
|---|---|
|**path**|path to folder to watch|

## Returns ##
Returns a new FileSystemWatcher object if the specified directory exists, otherwise NULL is returned.

## Remarks ##
Once the FileSystemWatcher object is created, it will monitor the directory to detect changes. When changes occur an event will be emitted. The event ID will be EVENT_FILE_CREATE, EVENT_FILE_DELETE, EVENT_FILE_RENAME, or EVENT_FILE_CHANGE.

## Example ##
```c++
/*---------------------------------------------------------------------------------------------------
This example demonstrates use of a FileSystemWatcher to allow dynamic asset reloading.
Run the example and modify the texture file in a paint program to see your changes appear as the program is running.
---------------------------------------------------------------------------------------------------*/

// Get the primary display
auto displaylist = ListDisplays();
auto display = displaylist[0];
auto displayscale = display:GetScale();

// Create a window
auto window = CreateWindow(display, "Example", 0, 0, math.min(1280 * displayscale.x, display.size.x), math.min(720 * displayscale.y, display.size.y), WINDOW_TITLEBAR);

// Create a rendering framebuffer
auto framebuffer = CreateFramebuffer(window);

// Create a world
auto world = CreateWorld();

// Create a camera
auto camera = CreateCamera(world);
camera->Move(0,0,-1);

// Create a light
auto light = CreateLight(world,LIGHT_DIRECTIONAL);

// Display material
auto model = CreateBox(world);

// Create material
auto mtl = CraateMaterial();
model->SetMaterial(mtl);

// Download the texture file
CopyFile("https://github.com/...", "brickwall.jpg");

auto tex = LoadTexture("dirt.jpg");
mtl->SetTexture(tex);

// Main loop
while (window->Closed() == false)
{
  //Check for file change events
  while (PeekEvent())
  {
    auto e = WaitEvent();
    if (e.id == EVENT_FILE_CHANGE)
    {
      //Look for a loaded asset with this file path
      auto asset = FindCachedAsset(e.filepath[0]);
      if (asset)
      {
        //Reload the modified asset
        asset->Reload();
      }
    }
  }
  
  world->Update()
  world->Render(framebuffer)
}
```
