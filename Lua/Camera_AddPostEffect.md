# Camera:AddPostEffect

This method adds a post-processing effect to a camera.

## Syntax

```lua
function Camera:AddPostEffect(effect)
```

| Parameter | Description |
|---|---|
| effect | post-processing effect to add |

## Returns

Returns the index of the added post-processing effect, or negative one (-1) if the effect could not be added.

## Remarks

A camera may have up to eight post-processing effects added.