# Program:SetThumbnail


## Syntax

- void **SetThumbnail**(Widget widget, string path, Package package, boolean first = false)

# Remarks

This method will cause the program thumbnail system to asynchronously load and assign a thumbnail image to a widget. If the image is not in the thumbnail cache, it will be generated in a background process.

This method can be called at any time without stalling the program.
