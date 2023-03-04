# Package::WriteFile

This method writes a new file to a package.

## Syntax

- shared_ptr<[Stream](Stream.md)\> **WriteFile**(const [WString](WString.md)& path)

## Returns

Returns a new stream if successful, otherwise NULL is returned.

If the package is closed NULL will be returned.


