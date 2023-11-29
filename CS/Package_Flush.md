# Package.Flush

This method will execute any queued changes to the package.

## Syntax

```csharp
bool Flush()
```

## Returns

Returns `true` if the package is flushed successfully, otherwise `false` is returned.

If there are open streams writing to the package, `false` will be returned.

If the package file cannot be written to, `false` will be returned.

## Remarks

This method can be called multiple times. Files can still be read from and written to after this method is called.