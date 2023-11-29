# Framebuffer

This class provides an interface for displaying Vulkan graphics on the screen.

Base class: [Object](Object.md)

| Property | Type | Description |
|---|---|---|
| window | `const shared_ptr<[Window](Window.md)>` | read-only window object |
| [Capture](Framebuffer_Capture.md) | Method | captures a rendering frame |
| [GetCaptures](Framebuffer_GetCaptures.md) | Method | retrieves any captured screen images |
| [GetSize](FrameBuffer_GetSize.md) | Method | gets the framebuffer dimensions |
| [CreateFramebuffer](CreateFramebuffer.md) | Function | creates a new framebuffer object |

```csharp
public class Framebuffer : Object
{
    public shared_ptr<Window> window; // read-only window object

    public void Capture() // captures a rendering frame
    {
        // code to capture a rendering frame
    }

    public List<Image> GetCaptures() // retrieves any captured screen images
    {
        // code to retrieve captured screen images
    }

    public Vector2 GetSize() // gets the framebuffer dimensions
    {
        // code to get the framebuffer dimensions
    }

    public Framebuffer CreateFramebuffer() // creates a new framebuffer object
    {
        // code to create a new framebuffer object
    }
}
```