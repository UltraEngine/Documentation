# Package::Close

This method will flush any queued changes and close the package.

## Syntax

- bool **Close**()

## Returns

Returns `true` if the package is closed successfully, otherwise `false` is returned.

If the package file cannot be written to, `false` will be returned.

## Remarks

Files cannot be read from and written to after this method is called successfully.

Packages are automatically closed upon deletion.

```csharp
namespace Package
{
    public class Package
    {
        public bool Close()
        {
            // Code to flush any queued changes and close the package
            return true;
        }
    }
}
```