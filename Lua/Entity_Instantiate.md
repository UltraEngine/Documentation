## Entity:Instantiate

This method returns an instanced copy of the entity. Resources such as model meshes are shared. If you want to create a unique copy of the entity, use the [Copy](Entity_Copy.md) method instead.

### Syntax

```lua
function Entity:Instantiate(world, recursive, callstart)
```

#### Parameters

- `world` - world to create new instance in
- `recursive` - if set to true the entity subhierarchy will also be copied
- `callstart` - if set to true the Start function will be called for all attached actors and scripts

### Returns

Returns an instanced copy of the entity.