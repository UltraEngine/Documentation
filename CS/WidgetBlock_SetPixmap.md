## Syntax

- **SetPixmap**(System.IntPtr pixmap)

| Parameter | Description |
| --- | --- |
| pixmap | pixmap to display |

## Example

```csharp
using System;

namespace GameEngine
{
    public class WidgetBlock
    {
        public void SetPixmap(IntPtr pixmap)
        {
            // implementation code here
        }
    }

    public class Pixmap
    {
        // pixmap class implementation
    }

    public class Program
    {
        public static void Main(string[] args)
        {
            WidgetBlock widgetBlock = new WidgetBlock();
            Pixmap pixmap = new Pixmap();

            // set the pixmap using SetPixmap method
            widgetBlock.SetPixmap(pixmap);
        }
    }
}
```