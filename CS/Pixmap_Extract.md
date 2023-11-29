### Pixmap.Extract(int x, int y, int width, int height)

This method extracts an area of the pixmap and returns it as a new pixmap.

#### Parameters

- `x` (int): x-coordinate position of the extracted area
- `y` (int): y-coordinate position of the extracted area
- `width` (int): width of the extracted area
- `height` (int): height of the extracted area

#### Returns

Returns a new `Pixmap` object if successful, otherwise `null` is returned.

If the extracted area lies outside the bounds of the pixmap, then `null` will be returned.

If the pixmap uses a compressed format and the position and dimensions of the extracted area are not evenly divisible by the block size, then `null` will be returned.

#### Example

```csharp
Pixmap originalPixmap = ... // Initialize original pixmap

int x = 10;
int y = 20;
int width = 30;
int height = 40;

Pixmap extractedPixmap = originalPixmap.Extract(x, y, width, height);
if (extractedPixmap != null)
{
    // Use the extracted pixmap
}
```