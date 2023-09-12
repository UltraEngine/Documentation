## FileSystemWatcher

This class provides an interface to monitor a directory for changes to its files.

### Property: CreateFileSystemWatcher

```lua
function CreateFileSystemWatcher(directory: string, filter: string): FileSystemWatcher
```

Creates a new `FileSystemWatcher` object to monitor the specified directory for changes to its files.

**Parameters:**

- `directory` (string): The directory to monitor.
- `filter` (string): The file filter to apply. Only files that match the filter will trigger events. Use `'*'` to include all files.

**Returns:**

- `FileSystemWatcher`: The created `FileSystemWatcher` object.

### Example

```lua
local fsWatcher = CreateFileSystemWatcher("path/to/directory", "*.txt")
fsWatcher.OnFileCreated:Connect(function(filePath)
    print("New file created:", filePath)
end)
```

In the above example, a `FileSystemWatcher` object is created to monitor a specific directory for new files with the extension `.txt`. When a new file is created, the `OnFileCreated` event is triggered and a callback function is connected to it. In this example, the callback function simply prints the path of the created file.