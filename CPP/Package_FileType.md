# Package::FileType

This method returns the type of a file in the archive.

## Syntax

- int **FileType**(const [WString](WString.md)& path)

| Parameter | Description |
|---|---|
| path | relative file path |

## Returns

If the file exists then one or two will be returned for a file or folder, otherwise zero will be returned.

## Remarks

It is possible for some package plugins to return a bitwise flag containing both 1 (file) and 2 (folder). If this method returns 3 then the file is a package-in-a-package. This can occur with Quake WAD or BSP files, which can be treated as both a file and a folder that contains additional files.
