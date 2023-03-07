# Stream::GetPackage

This method returns the package a stream was loaded from.

## Syntax

- shared_ptr<[Package](Package.md)\> **GetPackage**()

## Returns

If the stream was loaded from a package that has not been deleted yet it will be returned, otherwise NULL will be returned.
