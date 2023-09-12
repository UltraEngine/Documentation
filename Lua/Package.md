# Package

Base class: [Asset](Asset.md)

This class provides an interface for loading files from compressed and encrypted archives. Ultra Engine includes built-in support for Zip packages. Other archive formats can be added with the plugins system.

## Properties

### AddFile

```lua
function Package:AddFile(filename, sourcepath)
```

Writes a file to the package.

- `filename` (string): The name of the file to be added.
- `sourcepath` (string): The path to the source file.

### Close

```lua
function Package:Close()
```

Finalizes any pending changes and closes the package file.

### DeleteFile

```lua
function Package:DeleteFile(filename)
```

Deletes a file from the package.

- `filename` (string): The name of the file to be deleted.

### ExtractFile

```lua
function Package:ExtractFile(filename, destination)
```

Extracts a file from the package.

- `filename` (string): The name of the file to be extracted.
- `destination` (string): The path to the destination directory.

### FileSize

```lua
function Package:FileSize(filename)
```

Returns the size of a file in the package.

- `filename` (string): The name of the file.

### FileTime

```lua
function Package:FileTime(filename)
```

Returns the time of a file in the package.

- `filename` (string): The name of the file.

### FileType

```lua
function Package:FileType(filename)
```

Returns the type of a file in the package.

- `filename` (string): The name of the file.

### Flush

```lua
function Package:Flush()
```

Finalizes pending changes without closing the package.

### LoadDir

```lua
function Package:LoadDir(directory, recursive)
```

Loads the contents of a package directory.

- `directory` (string): The name of the directory to be loaded.
- `recursive` (boolean): If true, loads the directory recursively.

### ReadFile

```lua
function Package:ReadFile(filename)
```

Reads a file from the package.

- `filename` (string): The name of the file to be read.

### SetPassword

```lua
function Package:SetPassword(password)
```

Sets a password for encryption.

- `password` (string): The password to be set.

## Functions

### CreatePackage

```lua
function CreatePackage(filename)
```

Creates a new package.

- `filename` (string): The name of the package file to be created.

### LoadPackage

```lua
function LoadPackage(filename)
```

Loads a package from a file.

- `filename` (string): The name of the package file to be loaded.