# Bone:SetRotation

This method can be used to manually rotate a bone. You can control skinned models enirely in code or apply your own movements on top of animation.

## Syntax

- **SetRotation**(number pitch, number yaw, number roll, boolean = false)
- **SetRotation**([Vec3](Vec3.md) rotation, boolean global = false)
- **SetRotation**([Quat](Quat.md) rotation, boolean global = false)

| Parameter | Description |
|---|---|
| rotation, (pitch, yaw, roll) | rotation to set |
| global | if set to true rotation is relative to the skeleton, otherwise it is relative to the bone's parent |

## Remarks

To combine programmatic movement with animation, this method should be called after [World::Update](World_Update.md) and before [World::Render](World_Render.md).

## Example

This example will load and display an animated model, but we will add code to turn the character's head back and forth as they walk.

![](https://raw.githubusercontent.com/UltraEngine/Documentation/master/Images/bone_setrotation.jpg)


```lua
local world = CreateWorld()
local camera = CreateCamera(world)
local light = CreateBoxLight(world)
local model = LoadModel(world, "https://github.com/UltraEngine/Documentation/raw/master/Assets/Models/Characters/Fox.glb")
local neck = model.skeleton:FindBone("b_Neck_04")
local rotation = Vec3()

-- Main loop
while window:Closed() == false do
    world:Update()

    rotation.y = Cos(Millisecs() / 10.0) * 65.0
    neck:SetRotation(rotation)

    world:Render(framebuffer)
end
```
