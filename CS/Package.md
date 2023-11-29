# Package

Base class: [Asset](Asset.md)

This class provides an interface for loading files from compressed and encrypted archives. Ultra Engine includes built-in support for Zip packages. Other archive formats can be added with the plugins system.

| Property | Type | Description |
| --- | --- | --- |
| [AddFile](Package_AddFile.md) | Method | writes a file to the package |
| [Close](Package_Close.md) | Method | finalizes any pending changes and closes the package file |
| [DeleteFile](Package_DeleteFile.md) | Method | deletes a file from the package |
| [ExtractFile](Package_ExtractFile.md) | Method | extracts a file from the package |
| [FileSize](Package_FileSize.md) | Method | returns the size of a file in the package |
| [FileTime](Package_FileTime.md) | Method | returns the time of a file in the package |
| [FileType](Package_FileType.md) | Method | returns the type of a file in the package |
| [Flush](Package_Flush.md) | Method | finalizes pending changes without closing the package |
| [LoadDir](Package_LoadDir.md) | Method | loads the contents of a package directory |
| [ReadFile](Package_ReadFile.md) | Method | reads a file from the package |
| [SetPassword](Package_SetPassword.md) | Method | sets a password for encryption |
| [CreatePackage](CreatePackage.md) | Function | creates a new package |
| [LoadPackage](LoadPackage.md) | Function | loads a package from a file |

## Syntax

```csharp
public class Package
{
    public void AddFile(string filePath, string packagePath);
    public void Close();
    public void DeleteFile(string packagePath);
    public void ExtractFile(string packagePath, string filePath);
    public int FileSize(string packagePath);
    public DateTime FileTime(string packagePath);
    public string FileType(string packagePath);
    public void Flush();
    public void LoadDir(string packagePath);
    public byte[] ReadFile(string packagePath);
    public void SetPassword(string password);
}

public static class PackageUtil
{
    public static Package CreatePackage(string filePath);
    public static Package LoadPackage(string filePath);
}
```