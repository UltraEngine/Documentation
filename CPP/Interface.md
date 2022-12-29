# Interface

Base class: [Object](Object.md)

This class is used to create a graphical user interface.

| Property | Type | Description |
| --- | --- | --- |
| root | const shared_ptr<[Widget](Widget.md)>& | read-only pointer to root panel widget |
| scale | const float& | read-only interface DPI scaling value |
| [LoadColorScheme](Interface_LoadColorScheme) | Method | loads a GUI color scheme from a JSON file |
| [SetRenderLayers](Interface_SetRenderLayers.md) | Method | sets the interface render layers, for 3D graphics |
| [SetScale](Interface_SetScale.md) | Method | sets the interface DPI scaling value |
| [SetSize](Interface_SetSize.md) | Method | resizes the interface |
| [CreateInterface](CreateInterface.md) | Function | creates a new graphical user interface |
