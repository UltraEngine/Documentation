## Syntax

```csharp
Entity Instantiate(World world, bool recursive = true, bool callstart = true)
```

## Parameters

| Parameter | Description |
| --- | --- |
| world | The world to create a new instance in |
| recursive | If set to true, the entity subhierarchy will also be copied |
| callstart | If set to true, the Start function will be called for all attached actors and scripts |

## Returns

Returns an instanced copy of the entity.

## Example

```csharp
World world = new World();
Entity originalEntity = new Entity();

Entity copiedEntity = originalEntity.Instantiate(world);
```