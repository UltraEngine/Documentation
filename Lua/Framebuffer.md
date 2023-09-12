# Framebuffer

This class provides an interface for displaying Vulkan graphics on the screen.

Base class: [Object](Object)

## Properties

| Property | Type | Description |
|---|---|---|
| window | const [Window](Window.md)& | read-only window object |

## Methods

### Capture

```lua
function Framebuffer:Capture()
```

Captures a rendering frame.

### GetSize

```lua
function Framebuffer:GetSize()
```

Gets the framebuffer dimensions.

## Functions

### CreateFramebuffer

```lua
function CreateFramebuffer()
```

Creates a new framebuffer object.