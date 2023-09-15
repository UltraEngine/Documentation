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

## loadcolorscheme

```lua
function LoadColorScheme(filename: string)
```

Loads a GUI color scheme from a JSON file.

Parameters:
- `filename` (string): The name of the JSON file containing the color scheme.

## processevent

```lua
function ProcessEvent(event: any)
```

Sends an event to the interface for evaluation.

Parameters:
- `event` (any): The event to be processed.

## setrenderlayers

```lua
function SetRenderLayers(layers: table)
```

Sets the interface render layers, for 3D graphics.

Parameters:
- `layers` (table): The render layers to be set.

## setscale

```lua
function SetScale(scale: number)
```

Sets the interface DPI scaling value.

Parameters:
- `scale` (number): The DPI scaling value to be set.

## setsize

```lua
function SetSize(width: number, height: number)
```

Resizes the interface.

Parameters:
- `width` (number): The width to be set.
- `height` (number): The height to be set.

## createinterface

```lua
function CreateInterface()
```

Creates a new graphical user interface.
