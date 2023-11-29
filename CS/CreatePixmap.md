# CreatePixmap

This function creates a new pixmap with the specified size and format.

## Syntax

```csharp
Pixmap CreatePixmap(int width, int height, TextureFormat format = TextureFormat.TEXTURE_RGBA, Buffer pixeldata = null);
```

| Parameter | Description |
|---|---|
| width | width of the pixmap |
| height | height of the pixmap |
| format | pixmap pixel format, can be `TextureFormat.TEXTURE_RGBA`, `TextureFormat.TEXTURE_RGB`, `TextureFormat.TEXTURE_RG`, `TextureFormat.TEXTURE_BGRA`, `TextureFormat.TEXTURE_BGR`, `TextureFormat.TEXTURE_RED`, `TextureFormat.TEXTURE_RED16`, or the compressed formats `TextureFormat.TEXTURE_BC1`, `TextureFormat.TEXTURE_BC3`, `TextureFormat.TEXTURE_BC5`, or `TextureFormat.TEXTURE_BC7` |
| pixeldata | if specified the pixmap pixel data will be filled with the buffer contents |

## Returns

Returns a new pixmap object.

## Example

```csharp
using UltraEngine;

class Program
{
    static void Main(string[] args)
    {
        //Get the displays
        var displays = Display.GetDisplays();

        //Create window
        var window = Window.Create("Ultra Engine", 0, 0, 800, 600, displays[0]);

        //Create user interface
        var ui = Interface.Create(window);

        //Create a pixmap
        var pixmap = Pixmap.CreatePixmap(512, 512);
        pixmap.Fill(new RGBA(0, 0, 255, 255));

        //Show the pixmap
        ui.Background.SetPixmap(pixmap);

        while (true)
        {
            var ev = WaitForEvent();
            switch (ev.id)
            {
                case EventID.EVENT_WINDOWCLOSE:
                    return;
            }
        }
    }
}
```