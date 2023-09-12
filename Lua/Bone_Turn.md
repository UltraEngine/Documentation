# Bone:Turn

This method smoothly adds rotation to the current rotation.

## Syntax

- **Bone:Turn**(pitch: number, yaw: number, roll: number)
- **Bone:Turn**(rotation: [Vec3](#vec3) )

| Parameter | Description |
|---|---|
| rotation, (pitch, yaw, roll) | rotation to apply |
| global | if set to true rotation is relative to the skeleton, otherwise it is relative to the bone's parent |

## Remarks

To combine programmatic movement with animation, this method should be called after [World:Update](worldupdate) and before [World:Render](worldrender).

## Example

This example will load and display an animated model, but we will add code to turn the character's head back and forth as they walk.

![bone_setrotation.jpg](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/bone_setrotation.jpg)

```lua
--Get the displays
local displays = UltraEngine.GetDisplays()

--Create a window
local window = UltraEngine.CreateWindow("Ultra Engine", 0, 0, 1280, 720, displays[0], WINDOW_CENTER | WINDOW_TITLEBAR)

--Create a framebuffer
local framebuffer = UltraEngine.CreateFramebuffer(window)

--Create a world
local world = UltraEngine.CreateWorld()

--Create a camera
local camera = UltraEngine.CreateCamera(world)
camera:SetClearColor(0.125)
camera:SetFOV(70)
camera:Move(0, 2, -8)

--Create light
local light = UltraEngine.CreateBoxLight(world)
light:SetRotation(45, 35, 0)
light:SetRange(-10, 10)

--Load FreeImage plugin
local plugin = UltraEngine.LoadPlugin("Plugins/FITextureLoader")

--Model by PixelMannen
--https://opengameart.org/content/fox-and-shiba
local model = UltraEngine.LoadModel(world, "https://github.com/UltraEngine/Documentation/raw/master/Assets/Models/Characters/Fox.glb")
model:SetScale(0.05)
model:Animate(1)
model:SetRotation(0, -90, 0)

local neck = model.skeleton:FindBone("b_Neck_04")
local rotation = UltraEngine.Vec3()

--Main loop
while window:Closed() == false do
    world:Update()

    rotation.y = math.cos(UltraEngine.Millisecs() / 10.0) * 65.0
    neck:Turn(rotation, true)

    world:Render(framebuffer)
end
```

## Vec3

A class that represents a 3D vector.

### Properties

- **x**: number - The x component of the vector.
- **y**: number - The y component of the vector.
- **z**: number - The z component of the vector.

### Methods

- **Vec3:New**(x: number, y: number, z: number): [Vec3](#vec3) - Creates a new Vec3 object with the specified components.
- **Vec3:Length**(): number - Returns the length of the vector.
- **Vec3:Normalize**(): [Vec3](#vec3) - Returns a normalized version of the vector.
- **Vec3:Dot**(other: [Vec3](#vec3)): number - Calculates the dot product with another vector.
- **Vec3:Cross**(other: [Vec3](#vec3)): [Vec3](#vec3) - Calculates the cross product with another vector.
- **Vec3:Add**(other: [Vec3](#vec3)): [Vec3](#vec3) - Adds another vector to this vector.
- **Vec3:Sub**(other: [Vec3](#vec3)): [Vec3](#vec3) - Subtracts another vector from this vector.
- **Vec3:Mul**(scalar: number): [Vec3](#vec3) - Multiplies the vector by a scalar value.
- **Vec3:Div**(scalar: number): [Vec3](#vec3) - Divides the vector by a scalar value.
