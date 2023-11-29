# Camera.AddPostEffect

This method adds a post-processing effect to a camera.

## Syntax

```csharp
int AddPostEffect(PostEffect effect)
```

| Parameter | Description |
|---|---|
| effect | post-processing effect to add |

## Returns

Returns the index of the added post-processing effect, or -1 if the effect could not be added.

## Remarks

A camera may have up to eight post-processing effects added.

# Example

```csharp
PostEffect bloomEffect = new BloomEffect();
int index = camera.AddPostEffect(bloomEffect);
```

In this example, a new `BloomEffect` is created and added to the camera using the `AddPostEffect` method. The method returns the index of the added effect, which can be used for further manipulation or removal if needed.