# CreateFramebuffer

This function creates a new framebuffer object for 2D and 3D rendering.

## Syntax
- ```cs
  Framebuffer CreateFramebuffer(Window window)
  ```

| Parameter | Description |
| --- | --- |
| window | window to create the framebuffer on |

## Returns

Returns a new framebuffer object if one is successfully created, otherwise NULL is returned.

## Remarks

A framebuffer cannot be created on a window that uses the WINDOW_RESIZABLE window style, unless the multi-threaded renderer is disabled by calling [AsyncRender](AsyncRender.md) prior to engine initialization.

## Example
  
```cs
using UltraEngine;
using System;

public class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create a window
        var window = Window.Create("Ultra Engine", 0, 0, 1280, 720, displays[0], WindowStyles.WINDOW_TITLEBAR | WindowStyles.WINDOW_CENTER);

        //Create a framebuffer
        var framebuffer = CreateFramebuffer(window);

        //Create a world
        var world = World.Create();

        //Create a camera
        var camera = Camera.Create(world);
        camera.SetClearColor(0.125f);
        
        //Main loop
        while (!window.Closed() && !window.KeyHit(ConsoleKey.Escape))
        {
            //Update world
            world.Update();

            //Render world
            world.Render(framebuffer, true);
        }
    }
}
```