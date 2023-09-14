# light.SetRange

This method sets the distance to which the light illuminates.

## Syntax

- **SetRange**(number nearrange, number farrange)`
- **SetRange**(number farrange)`

## Parameters

| Parameter | Description |
|---|---|
| nearrange | near range used for shadow map rendering |
| farrange | the maximum distance the light can reach |

## Remarks

Point and spot lights should use a near and far range above zero.

Box lights can have a negative near range, to make light appear behind the light position.
