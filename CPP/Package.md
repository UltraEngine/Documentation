# Package

Base class: [Asset](Asset.md)

This class provides an interface for loading files from compressed and encrypted archives. Ultra Engine includes built-in support for Zip packages. Other archive formats can be added with the plugins system.

| Property | Type | Description |
| - | - | - |
| [Close](Package_Close.md) | Method | finalizes all pending changes and closes the package |
| [DeleteFile](Package_DeleteFile.md) | Method | deletes a file from the archive |
| [FileSize](Package_FileSize.md) | Method | returns the size of a file in the archive |
| [FileType](Package_FileType.md) | Method | returns the type of a file in the archive |
| [Flush](Package_Flush.md) | Method | finalizes pending changes without closing the package |
| [ReadFile](Package_ReadFile.md) | Method | reads a file from the archive |
| [SetPassword](Package_SetPassword.md) | Method | sets a password, for encrypted archives |
| [LoadPackage](LoadPackage.md) | Function | loads a package from a file |
| [WriteFile](Package_WriteFile.md) | Method | writes a file to the archive |
