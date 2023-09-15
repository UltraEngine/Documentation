# Interface

Base class: [Object](Object.md)

This class is used to create a graphical user interface.

| Property | Type | Description |
| --- | --- | --- |
| background | [Widget](Widget.md) | read-only top-level panel widget |
| scale | number | read-only interface DPI scaling value |
| [LoadColorScheme](#interface_loadcolorscheme) | Function | loads a GUI color scheme from a JSON file |
| [ProcessEvent](#interface_processevent) | Function | send an event to the interface for evaluation |
| [SetRenderLayers](#interface_setrenderlayers) | Function | sets the interface render layers, for 3D graphics |
| [SetScale](#interface_setscale) | Function | sets the interface DPI scaling value |
| [SetSize](#interface_setsize) | Function | resizes the interface |
| [CreateInterface](#createinterface) | Function | creates a new graphical user interface |
