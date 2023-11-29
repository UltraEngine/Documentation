# MoveTowards

This function increments one value towards a target at a steady rate.

## Syntax

- float **MoveTowards**(float start, float stop, float amount)
- double **MoveTowards**(double start, double stop, double amount)

| Parameter | Description |
|---|---|
| start | beginning value |
| stop | destination value |
| amount | maximum distance to move |

## Returns

Returns the incremented value. If the difference between the values is less than *amount* then *stop* will be returned.

## Example

```csharp
float result = MoveTowards(10f, 20f, 5f);
// result: 15f

double result = MoveTowards(5.0, 10.0, 3.0);
// result: 8.0
```