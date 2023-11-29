## Syntax

```csharp
Mat4 Transpose()
```

## Returns

Returns the transpose matrix.

## Example

```csharp
Mat4 matrix = new Mat4(1, 2, 3, 4,
                       5, 6, 7, 8,
                       9, 10, 11, 12,
                       13, 14, 15, 16);

Mat4 transposeMatrix = matrix.Transpose();
```