# Camera::AddPostEffect

This method adds a post-processing effect to a camera.

## Syntax

int **AddPostEffect**(shared_ptr<[PostEffect](PostEffect.md)\> effect)

| Parameter | Description |
|---|---|
| effect | post-processing effect to add |

## Returns

Returns the index of the added post-processing effect, or negative one if the effect could not be added.

## Remarks

A camera may have up to eight post-processing effects added.
