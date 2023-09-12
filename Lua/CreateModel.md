# CreateModel

This function creates a new model.

## Syntax

`function CreateModel(world: shared_ptr) -> shared_ptr`

## Parameters

- `world` : a shared_ptr to the world to create the model in

## Returns

Returns a new model.

## Example

```lua
local model = CreateModel(world)
```

In this example, `world` is a shared_ptr to the world where the model is created. The function `CreateModel` is then called to create a new model, which is assigned to the variable `model`.