# Interface

Base class: [Object](Object.md)

This class is used to create a graphical user interface.

| Property | Type | Description |
| --- | --- | --- |
| background | readonly [Widget](Widget.md) | read-only pointer to top-level panel widget |
| scale | readonly float | read-only interface DPI scaling value |
| [LoadColorScheme](Interface_LoadColorScheme.md) | Method | loads a GUI color scheme from a JSON file |
| [ProcessEvent](Interface_ProcessEvent.md) | Method | send an event to the interface for evaluation |
| [SetRenderLayers](Interface_SetRenderLayers.md) | Method | sets the interface render layers, for 3D graphics |
| [SetScale](Interface_SetScale.md) | Method | sets the interface DPI scaling value |
| [SetSize](Interface_SetSize.md) | Method | resizes the interface |
| [CreateInterface](CreateInterface.md) | Function | creates a new graphical user interface |


## Example

**C# code**:

```C#
Object background; // read-only pointer to top-level panel widget
float scale; // read-only interface DPI scaling value

public void LoadColorScheme(string filePath)
{
    // logic for loading a GUI color scheme from a JSON file
}

public void ProcessEvent()
{
    // logic for sending an event to the interface for evaluation
}

public void SetRenderLayers()
{
    // logic for setting the interface render layers, for 3D graphics
}

public void SetScale(float scaleValue)
{
    // logic for setting the interface DPI scaling value
}

public void SetSize()
{
    // logic for resizing the interface
}

public Interface CreateInterface()
{
    // logic for creating a new graphical user interface
}
```
