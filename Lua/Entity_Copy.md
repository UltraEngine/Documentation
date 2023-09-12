# Entity:Copy

This function returns a unique copy of the entity. Resources such as model meshes are duplicated, creating a new unique object. For faster performance and lower memory usage, consider using the [Entity:Instantiate](Entity_Instantiate.md) function instead.

## Syntax

`function Entity:Copy(world: World, recursive: boolean, callstart: boolean) -> Entity`

## Parameters

- `world`: The world to create the new copy in.
- `recursive`: If set to `true`, the entity subhierarchy will also be copied. Default is `true`.
- `callstart`: If set to `true`, the Start function will be called for all attached actors and scripts. Default is `true`.

## Returns

A copy of the entity.