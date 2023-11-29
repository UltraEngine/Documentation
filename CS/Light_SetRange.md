# Light.SetRange

This method sets the distance to which the light illuminates.

## Syntax

- void **SetRange**(float nearrange, float farrange)
- void **SetRange**(float farrange)

| Parameter | Description |
|---|---|
| nearrange | near range used for shadow map rendering |
| farrange | the maximum distance the light can reach |

## Remarks

Point and spot lights should use a near and far range above zero.

Box lights can have a negative near range, to make light appear behind the light position.


### Example

```csharp
// Example 1
light.SetRange(10.0f, 100.0f);

// Example 2
light.SetRange(100.0f);
```